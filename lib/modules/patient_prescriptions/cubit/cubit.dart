import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'states.dart';

class PrescriptionCubit extends Cubit<PrescriptionStates> {
  PrescriptionCubit() : super(PrescriptionInitialState());

  static PrescriptionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final String _rpcURl = "http://127.0.0.1:7545";
  final String _wsURl = "ws://127.0.0.1:7545";
  final String _privateKey =
      "0x63df1c92de71f8d45fde18cf85677dda18afb2ca3084fc8c0a0ee08fed1d9dc3";

  late Web3Client _client;
  late String _abiCode;

  late EthereumAddress _contractAddress;
  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _addRecord;
  late ContractFunction _getRecords;

  bool isLoading = true;
  String? deployedRecord;

  initialSetup() async {
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websockets instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcURl, Client());

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    // Reading the contract abi
    String abiStringFile =
        await rootBundle.loadString("src/artifacts/EHR.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);
    print(jsonAbi["abi"]);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
    print(_contractAddress);
  }

  Future<void> getCredentials() async {
    _credentials = await EthPrivateKey.fromHex(_privateKey);
    print("_credentials: $_credentials");
  }

  Future<void> getDeployedContract() async {
    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "EHR"), _contractAddress);

    // Extracting the functions, declared in contract.
    _addRecord = _contract.function("addRecord");
    _getRecords = _contract.function("getRecords");
    getRecords();
  }

  Future<void> getRecords() async {
    // Getting the current record declared in the smart contract.
    EthereumAddress patientAddress =
        EthereumAddress.fromHex("0xdA46bbDdeFec42d1EEe11B54Ea6c065EBc1Fa850");
    EthereumAddress doctorAddress =
        EthereumAddress.fromHex("0xF87547989843cAb53c6Ad35d1a9012935e8aDF8d");
    var currentRecord = await _client.call(
        sender: doctorAddress,
        contract: _contract,
        function: _getRecords,
        params: [patientAddress]);
    print(currentRecord);
    deployedRecord = currentRecord[0];
    isLoading = false;
    emit(GetRecordsState());
  }

  Future<void> addRecord(String cid, String fileName, String patientAddress,
      String doctorAddress) async {
    isLoading = true;
    emit(AddRecordsState());
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
          contract: _contract,
          function: _addRecord,
          parameters: [cid, fileName, patientAddress, doctorAddress],
          // gasPrice: EtherAmount.inWei(BigInt.one),
          // maxGas: 100000,
          // value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
        ));
    getRecords();
  }
}
