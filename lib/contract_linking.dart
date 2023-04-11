// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:web3dart/web3dart.dart';
// import 'package:web_socket_channel/io.dart';
//
// import 'modules/prescription/cubit/cubit.dart';
//
// class ContractLinking extends PrescriptionCubit {
//   final String _rpcURl = "HTTP://127.0.0.1:7545/";
//   final String _wsURl = "ws://127.0.0.1:7545/";
//   final String _privateKey =
//       "63df1c92de71f8d45fde18cf85677dda18afb2ca3084fc8c0a0ee08fed1d9dc3";
//
//   late Web3Client _client;
//   late String _abiCode;
//
//   late EthereumAddress _contractAddress;
//   late Credentials _credentials;
//
//   late DeployedContract _contract;
//   late ContractFunction _addRecord;
//   late ContractFunction _getRecords;
//
//   bool isLoading = true;
//   String? deployedEHR;
//
//   ContractLinking() {
//     initialSetup();
//   }
//
//   initialSetup() async {
//     // establish a connection to the ethereum rpc node. The socketConnector
//     // property allows more efficient event streams over websockets instead of
//     // http-polls. However, the socketConnector property is experimental.
//     _client = Web3Client(_rpcURl, Client(), socketConnector: () {
//       return IOWebSocketChannel.connect(_wsURl).cast<String>();
//     });
//
//     await getAbi();
//     await getCredentials();
//     await getDeployedContract();
//   }
//
//   Future<void> getAbi() async {
//     // Reading the contract abi
//     String abiStringFile =
//         await rootBundle.loadString("src/artifacts/EHR.json");
//     var jsonAbi = jsonDecode(abiStringFile);
//     _abiCode = jsonEncode(jsonAbi["abi"]);
//     print({_abiCode});
//
//     _contractAddress =
//         EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
//     print({_contractAddress});
//   }
//
//   Future<void> getCredentials() async {
//     _credentials = EthPrivateKey.fromHex(_privateKey);
//     print({_credentials});
//   }
//
//   Future<void> getDeployedContract() async {
//     // Telling Web3dart where our contract is declared.
//     _contract = DeployedContract(
//         ContractAbi.fromJson(_abiCode, "EHR"), _contractAddress);
//
//     // Extracting the functions, declared in contract.
//     _addRecord = _contract.function("addRecord");
//     _getRecords = _contract.function("getRecords");
//     getRecords();
//   }
//
//   Future<void> getRecords() async {
//     // Getting the current name declared in the smart contract.
//     var currentName = await _client
//         .call(contract: _contract, function: _getRecords, params: []);
//     // print(currentName);
//     deployedEHR = currentName[0];
//     isLoading = false;
//     // notifyListeners();
//   }
//
//   Future<void> addRecord(String EHRToSet) async {
//     // Setting the name to nameToSet(name defined by user)
//     isLoading = true;
//     // notifyListeners();
//     await _client.sendTransaction(
//         _credentials,
//         Transaction.callContract(
//           contract: _contract,
//           function: _addRecord,
//           parameters: [EHRToSet],
//           // gasPrice: EtherAmount.inWei(BigInt.one),
//           // maxGas: 100000,
//           // value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
//         ));
//     getRecords();
//   }
// }
