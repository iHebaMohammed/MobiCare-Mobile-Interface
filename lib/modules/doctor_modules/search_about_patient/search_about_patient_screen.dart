import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/components/text_form_field_component.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class SearchAboutPatientScreen extends StatelessWidget {
  SearchAboutPatientScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DefaultTextFormField(
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
              DefaultSearchRowUserViewItem(
                  isMale: false,
                  image: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
                  name: 'Heba Adel',
              ),
              DefaultSearchRowUserViewItem(
                isMale: true,
                image: 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1677116117~exp=1677116717~hmac=0eaee5fcf6754432b852deadbe808bb6b5344e8ef73dc3e38fa9847446bcbcd0',
                name: 'Ahmed Ali',
              ),
              DefaultSearchRowUserViewItem(
                isMale: false,
                image: 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1677116117~exp=1677116717~hmac=0eaee5fcf6754432b852deadbe808bb6b5344e8ef73dc3e38fa9847446bcbcd0',
                name: 'OASIS Doctor Ahmed Maged',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
