import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobi_care/shared/components/components.dart';

class PaymentDoneScreen extends StatelessWidget {
  const PaymentDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 60),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Congratulations',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/payment/done_payment.svg',
                ),
                Column(
                  children: [
                    Text(
                      'That’s it!',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    Text(
                      'You have siccessfully checked out using your card',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                      ),
                    ),
                  ],
                ),
                defaultButton(function: (){}, text: 'Ok' , redius: 6)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
