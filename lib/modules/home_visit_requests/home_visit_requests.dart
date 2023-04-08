import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeVisitRequests extends StatelessWidget {
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
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Mohammed Ali'),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View request'),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFF1BAEA6)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Naira Mohammed'),
                    SizedBox(
                      width: 33,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View request'),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFF1BAEA6)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Naira Fawzy'),
                    SizedBox(
                      width: 66,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View request'),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFF1BAEA6)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Mohammed Ali'),
                    SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View request'),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFF1BAEA6)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Ahmed Mohammed'),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('View request'),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFF1BAEA6)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
