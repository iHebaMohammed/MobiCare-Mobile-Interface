import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3dart/web3dart.dart';

import '../../../../shared/network/remote/web3.dart';
import 'states.dart';

class PrescriptionCubit extends Cubit<PrescriptionStates> {
  PrescriptionCubit() : super(PrescriptionInitialState());

  static PrescriptionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final connector = BlockchainConnection.connector;
  EthereumAddress? senderAddress;

  late List<dynamic> records = [];
  dynamic session;

  blockchainSetup() async => await BlockchainConnection.initialSetup();

  changeSession(dynamic newSession) {
    session = newSession;
    print("session: $session");
  }

  Future<void> connectMetaMaskWallet(BuildContext context) async {
    senderAddress = await BlockchainConnection.connectMetaMaskWallet(context);
    emit(GetSenderAddressState());
  }

  Future<void> addRecord(String cid, EthereumAddress patientAddress) async {
    try {
      await BlockchainConnection.addRecord(cid, patientAddress);
    } catch (err) {
      print("err: $err");
    }
  }

  Future<void> getRecords(EthereumAddress patientAddress) async {
    // Getting the current record declared in the smart contract.
    await BlockchainConnection.getRecords(patientAddress);

    emit(GetRecordsState());
  }
}
