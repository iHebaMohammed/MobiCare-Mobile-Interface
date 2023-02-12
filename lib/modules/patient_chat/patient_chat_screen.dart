import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class PatientChatScreen extends StatelessWidget {
  const PatientChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          child: Column(
            children: [
              defaultChatRowUserViewItem(
                isMale: false,
                image: 'assets/user.jpg',
                name: 'Heba Adel',
                lastMessage: 'What’s up ? Everythings okay? What’s up ? Everythings okay?' ,
                dateOfLastMassage: '5/5/2005',
                numberOfMessage: '10',
              ),
              defaultChatRowUserViewItem(
                isMale: true,
                image: 'assets/user.jpg',
                name: 'Ahmed Ali',
                lastMessage: 'What’s up ? Everythings okay? What’s up ? Everythings okay?' ,
                dateOfLastMassage: '10:30 PM',
                numberOfMessage: '3',
              ),
            ],
          ),
      ),
    );
  }
}