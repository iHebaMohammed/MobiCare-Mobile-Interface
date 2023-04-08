import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children:  const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/90066039?s=400&u=7d6fd68c241b2192fdb9b4bfac974eee6075c314&v=4'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(

              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16.0,
                color: Colors.white,
              ),
            ),
              onPressed: (){},
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0,
                  ),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(5.0,),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.5,
                    ),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index) => buildStoryItem(),
                  separatorBuilder: (context , index) => SizedBox(
                    width: 20.0,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.0,
                    ),

                    itemCount: 15,
                ),


            ],
          ),
        ),
      ),
    );
  }

  // 1. build item
  // 2. build list
  // 3. add item to list

  // arrow function
  Widget buildChatItem() =>Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/90066039?s=400&u=7d6fd68c241b2192fdb9b4bfac974eee6075c314&v=4'),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only (
            bottom: 2.0,
            end: 2.0,
          ),
          child: CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    ),
    SizedBox(
      width: 20.0,
    ),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gerges milad',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Row(
              children: [
                Text(
                  'hello gergesssss',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),

                  ),
                ),
                Text(
                  '1:26 pm',
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  ],
);
  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/90066039?s=400&u=7d6fd68c241b2192fdb9b4bfac974eee6075c314&v=4'),
            ),
            Padding(
              padding:  EdgeInsetsDirectional.only (
                bottom: 2.0,
                end: 2.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),

        const Text(
          'Gerges Milad',
        ),

      ],
    ),
  );

}
