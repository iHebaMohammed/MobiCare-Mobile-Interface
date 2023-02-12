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
            defaultPostView(
                publisherName: 'Heba Adel',
                publisherImage: 'assets/user.jpg',
                postText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printe',
                isImage: false,
                image: 'assets/image.png',
                isVideo: false,
                isLiked: false,
                numberOfLikes: '25',
                numberOfComments: '14' ,
                dateOfPublish: '14/2/15',
            ),
            defaultPostView(
              publisherName: 'Heba Adel',
              publisherImage: 'assets/user.jpg',
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
