import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              defaultTextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validation: (value){
                    if(value!.isEmpty){
                      return 'Can\'t be empty';
                    }
                    return null;
                  },
                  fieldName: 'Search',
                  suffixIcon: Icons.search,
                  redius: 30,
              ),
              defaultSearchRowUserViewItem(
                  isMale: false,
                  image: 'assets/user.jpg',
                  name: 'Heba Adel',
                  isDoctor: true,
              ),
              defaultSearchRowUserViewItem(
                isMale: true,
                image: 'assets/user.jpg',
                name: 'Ahmed Ali',
                isDoctor: true,
              ),
              defaultSearchRowUserViewItem(
                isMale: false,
                image: 'assets/user.jpg',
                name: 'OASIS Doctor Ahmed Maged',
                isDoctor: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
