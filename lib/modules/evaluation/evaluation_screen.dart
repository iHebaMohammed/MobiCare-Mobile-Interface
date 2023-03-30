import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EvaluationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFF1BAEA6),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'MobiCare',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 40, right: 40),
        child: Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFFC9E8E6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1380&t=st=1677677962~exp=1677678562~hmac=4c69838e3e9cd11b1e59d7ec77ba300157ddcac1079dbc04ad9f507bc32f26b8'),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Dr.Ahmed Ali",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "How was your session?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                "Give us a quick feedback",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.all(3),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        print(rating);
                      })
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 50),
                      color: Color(0xFF1BAEA6),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: const Text(
                        'submit',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  OutlinedButton(
                    child: Text(
                      "Not now",
                      style: TextStyle(
                        color: Color(0xFF1BAEA6),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
