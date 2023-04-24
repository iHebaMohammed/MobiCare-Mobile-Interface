import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';

class PatientPostsViewScreen extends StatelessWidget {
  const PatientPostsViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DefaultPostView(
                publisherName: 'Heba Adel',
                publisherImage: 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1677116117~exp=1677116717~hmac=0eaee5fcf6754432b852deadbe808bb6b5344e8ef73dc3e38fa9847446bcbcd0',
                postText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printe',
                isImage: false,
                image: 'assets/image.png',
                isVideo: false,
                isLiked: false,
                numberOfLikes: '25',
                numberOfComments: '14' ,
                dateOfPublish: '14/2/15',
            ),
            DefaultPostView(
              publisherName: 'Heba Adel',
              publisherImage: 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1677116117~exp=1677116717~hmac=0eaee5fcf6754432b852deadbe808bb6b5344e8ef73dc3e38fa9847446bcbcd0',
              postText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printe',
              isImage: true,
              image: 'assets/image.png',
              isVideo: false,
              isLiked: true,
              numberOfLikes: '60',
              numberOfComments: '50' ,
              dateOfPublish: '14/2/15',
            ),
          ],
        ),
      ),
    );
  }
}
