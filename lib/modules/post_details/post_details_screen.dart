import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({Key? key}) : super(key: key);

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MobiCare',
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          defaultPostView(
              publisherName: 'Heba Adel',
              publisherImage: 'https://img.freepik.com/free-photo/stylish-good-looking-ambitious-smiling-brunette-woman-with-curly-hairstyle-cross-hands-chest-confident-professional-pose-smiling-standing-casually-summer-outfit-talking-friend-white-wall_176420-36248.jpg?w=1060&t=st=1677748376~exp=1677748976~hmac=a47d157f52938100a52d24cd7cd9802ee2f14fb84fe30813bc1994956a3a20b7',
              postText: 'Hi',
              isImage: true,
              isVideo: false,
              isLiked: true,
              numberOfLikes: '45',
              numberOfComments: '10',
              dateOfPublish: '10/10/2010',
            image: 'assets/image.png'
          ),
          SizedBox(
            height: 10,
          ),
          defaultCommentShape(
              image: 'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=1060&t=st=1677749858~exp=1677750458~hmac=ce1ac83e76dd7c93703d46dd8310eee222d6545f29a15240cb9f2952c1371719',
              name: 'Naira Mahmoud',
              isMale: false,
              textOfComment: 'Hello'
          ),
          defaultCommentShape(
              image: 'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=1060&t=st=1677749858~exp=1677750458~hmac=ce1ac83e76dd7c93703d46dd8310eee222d6545f29a15240cb9f2952c1371719',
              name: 'Naira Mahmoud',
              isMale: false,
              textOfComment: 'Hello'
          ),
          Spacer(),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryGreyColorD9D_50,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TextFormField(
                          controller: commentController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write a comment..',
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                            Icons.send_outlined,
                          color: primaryColor8DB,
                        ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
