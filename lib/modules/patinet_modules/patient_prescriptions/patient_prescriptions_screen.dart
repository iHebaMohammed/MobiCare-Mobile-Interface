import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobi_care/shared/network/remote/dio_helper.dart';
import 'package:mobi_care/shared/network/remote/web3_dio_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigate_component.dart';
import '../../../shared/network/remote/ip_address.dart';
import '../../../shared/styles/colors.dart';
import '../patient_search_prescription/patient_search_prescription_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientPrescriptionScreen extends StatelessWidget {
  PatientPrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrescriptionCubit, PrescriptionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PrescriptionCubit cubit = PrescriptionCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor1BA,
            centerTitle: true,
            title: Text(
              'Medical Prescription',
              style: TextStyle(
                color: primaryWhiteColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                      context: context,
                      widget: PatientSearchPrescriptionScreen());
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 270,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/shapes/top_shape.svg',
                      ),
                      Center(
                        child: SvgPicture.asset(
                          'assets/svg/prescription/prescription.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Here you can find your medical prescriptions',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(),
                ),
                const BuildPrescriptionItem(
                  dateTime: '13 / 2 / 2001',
                  doctorName: 'Mohammed Moataz',
                ),
                !cubit.connector.connected
                    ? Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              cubit.connectMetaMaskWallet(context);
                            },
                            child: const Text("Connect Wallet"),
                          )
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 20.0,
                        ),
                        child: Column(
                          children: [
                            const Text("You are connected"),
                            Text(
                                "senderAddress ${cubit.senderAddress ?? "not found!!"}"),
                          ],
                        ),
                      ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(cubit.records.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: primaryWhiteColor,
            ),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                File file = File(result.files.single.path!);
                final bytes = file.readAsBytesSync();
                final encodedFile = base64Encode(bytes);

                print(encodedFile);

                final decodedBytes = base64Decode(encodedFile);
                print(decodedBytes);

                File newFile = await File("newFile.jpeg").writeAsBytes(bytes);
                print(newFile);

//                 Directory appDocDirectory = await getApplicationDocumentsDirectory();
//
//                 new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)
// // The created directory is returned as a Future.
//                     .then((Directory directory) {
//                   print('Path of New Dir: '+directory.path);
//                 });

                Web3DioHelper.postData(data: {"file": bytes})
                    .then((value) => print(value))
                    .catchError((err) => print(err));
              } else {
                print("Canceled");
              }
            },
          ),
        );
      },
    );
  }
}
