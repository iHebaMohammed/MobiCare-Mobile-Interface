import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:mobi_care/modules/patient_search_prescription/patient_search_prescription_screen.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import 'package:web3dart/credentials.dart';
import '../../shared/components/components.dart';
import '../../shared/components/navigate_component.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class PatientPrescriptionScreen extends StatelessWidget {
  const PatientPrescriptionScreen({Key? key}) : super(key: key);

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
                    dateTime: '14 / 2 / 2001', doctorName: 'Mohammed Moataz'),
                cubit.session == null
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
                    : Column(
                        children: [
                          const Text("You are connected"),
                          Text("senderAddress\n ${cubit.senderAddress}"),
                        ],
                      )
              ],
            ),
          ),
          floatingActionButton: cubit.session == null
              ? null
              : FloatingActionButton(
                  onPressed: () async {
                    cubit.isLoading
                        // ? cubit.getRecords(cubit.senderAddress)
                        ? await cubit.addRecord(
                            "cid",
                            EthereumAddress.fromHex(
                                "0x9839548Ac44A81D26cB944c3f5a164B16C4Ef359"))
                        : print("cubit not loading!!!");
                  },
                  backgroundColor: primaryColor1BA,
                  child: const Icon(Icons.add),
                ),
        );
      },
    );
  }
}
