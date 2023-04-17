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
      name: 'MetaMask',
      description: 'MetaMask Wallet',
      url: 'https://metamask.io/',
      icons: [
        'https://cdn.iconscout.com/icon/free/png-512/metamask-2728406-2261817.png'
      ],
    ),
  );

  late String abiCode;

  late DeployedContract deployedContract;
  late ContractFunction _addRecord;
  late ContractFunction _getRecords;

  late EthereumAddress senderAddress;
  late Credentials credentials;

  dynamic session;
  bool isLoading = true;

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
          chainId: 11155111,
          onDisplayUri: (uri) async {
            await launchUrlString(uri, mode: LaunchMode.externalApplication);

            String privateKey = uri.split('=')[2];
            credentials = EthPrivateKey.fromHex(privateKey);
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

    EtherAmount amount = await client.getBalance(senderAddress);
    print("Amount: $amount");

    EthereumWalletConnectProvider provider =
        EthereumWalletConnectProvider(connector);

    print(provider);

  }

  // signTransaction() async {
  //   final provider = AlgorandWalletConnectProvider(connector);
  //
  //   Transaction tx = Transaction(
  //       from: senderAddress,
  //       maxGas: 1000000000,
  //       data: Uint8List.fromList("cid".codeUnits));
  //
  //   provider.signTransaction(tx as Uint8List);
  //
  //   // Kill the session
  //   connector.killSession();
  // }

  Future<void> addRecord(String cid, EthereumAddress patientAddress) async {
    isLoading = true;

    await client.sendTransaction(
        credentials,
        Transaction.callContract(
            contract: deployedContract,
            function: _addRecord,
            parameters: [cid, patientAddress]));
    await getRecords(patientAddress);
  }

  Future<void> getRecords(EthereumAddress patientAddress) async {
    // Getting the current record declared in the smart contract.
    client.call(
        contract: deployedContract,
        function: _getRecords,
        params: [patientAddress]).then((value) {
      print("================================");
      print("get records: $value");
      print("================================");

      var deployedRecord = value[0];
      print(deployedRecord);
      isLoading = false;

      emit(GetRecordsState());
    });
  }
}
