import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import '../../../shared/constants/constants.dart';
import 'states.dart';

class PrescriptionCubit extends Cubit<PrescriptionStates> {
  PrescriptionCubit() : super(PrescriptionInitialState());

  static PrescriptionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final Web3Client client = Web3Client(rpcURL, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsURL).cast<String>();
  });

  final EthereumAddress contractAddress =
      EthereumAddress.fromHex(sepoliaContractAddress);

  final connector = WalletConnect(
    bridge: bridge,
    clientMeta: const PeerMeta(
      name: walletName,
      description: walletDescription,
      url: walletURL,
      icons: [walletIcon],
    ),
  );

  late DeployedContract deployedContract;
  late ContractFunction _addRecord;
  late ContractFunction _getRecords;

  late EthereumAddress senderAddress;
  late Credentials credentials;
  late EtherAmount amount;

  late List<dynamic> records = [];

  dynamic session;

  initialSetup() async {
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websockets instead of
    // http-polls. However, the socketConnector property is experimental.

    await getAbi();
  }

  Future<void> getAbi() async {
    // Reading the contract abi
    await rootBundle.loadString("src/artifacts/EHR.json").then((value) async {
      dynamic jsonAbi = await jsonDecode(value);
      String abiCode = jsonEncode(jsonAbi["abi"]);

      getDeployedContract(abiCode);
    });
  }

  getDeployedContract(String abiCode) {
    // Telling Web3dart where our contract is declared.
    deployedContract = DeployedContract(
        ContractAbi.fromJson(abiCode, contractName), contractAddress);

    // Extracting the functions, declared in contract.
    _addRecord = deployedContract.function("addRecord");
    _getRecords = deployedContract.function("getRecords");
  }

  changeSession(dynamic newSession) {
    session = newSession;
    print("session: $session");
    emit(ChangeSessionState());
  }

  connectorEvents() {
    connector.on('connect', (session) => changeSession(session));
    connector.on('session_update', (payload) => changeSession(payload));
    connector.on('disconnect', (session) => changeSession(session));
  }

  Future<void> connectMetaMaskWallet(BuildContext context) async {
    connectorEvents();

    if (!connector.connected) {
      try {
        session = await connector.createSession(
          onDisplayUri: (uri) async {
            await launchUrlString(uri, mode: LaunchMode.externalApplication);

            String privateKey = uri.split('=')[2];
            credentials = await EthPrivateKey.fromHex(privateKey);
          },
        );

        senderAddress = EthereumAddress.fromHex(session.accounts[0]);

        await getCredentials();
      } catch (error) {
        print("error while connecting to the wallet $error");
      }
    }
  }

  getCredentials() async {
    amount = await client.getBalance(senderAddress);
    print("Amount: $amount");

    EthereumWalletConnectProvider provider =
        EthereumWalletConnectProvider(connector);
  }

  Future<void> addRecord(String cid, EthereumAddress patientAddress) async {
    try {
      List params = [cid, patientAddress]; // function parameters

      final gas = await client.estimateGas(
        sender: senderAddress,
        to: contractAddress,
        data: _addRecord.encodeCall(params),
      );
      print("gas: $gas");

      String txHash = await client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: deployedContract,
          function: _addRecord,
          parameters: params,
          gasPrice: EtherAmount.inWei(BigInt.from(200000000000000000)),
          from: senderAddress,
          maxGas: 115525,
        ),
        chainId: 11155111,
      );
      print("tx hash: $txHash");

    } catch (err) {
      print("err: $err");
    }
  }

  Future<void> getRecords(EthereumAddress patientAddress) async {
    // Getting the current record declared in the smart contract.
    records = await client.call(
      contract: deployedContract,
      function: _getRecords,
      params: [patientAddress],
    );

    var deployedRecord = records.toString();
    print("records: $deployedRecord");

    // connector.killSession();
    emit(GetRecordsState());
  }
}
