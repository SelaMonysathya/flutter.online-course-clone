import 'package:flutter/material.dart';
import 'package:online_course_clone/pages/chatDetailPage.dart';
import 'package:online_course_clone/theme/color.dart';
import 'package:online_course_clone/utils/chatPageJson.dart';

class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Chat',
        style: TextStyle(
          color: black
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(Icons.notifications, color: black,),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: black,),
        ),
      ],
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 45,
            width: size.width - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: grey)
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: TextField(
                cursorColor: black.withOpacity(0.5),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: black.withOpacity(0.5),),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: black.withOpacity(0.5)),
                  suffixIcon: Icon(Icons.mic, color: black.withOpacity(0.5),)
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Column(
          children: List.generate(chats.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 55,
                          width: (size.width - 30) * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(chats[index]['imageUrl']),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1.5, color: white),
                              color: chats[index]['active'] == 1 ? Colors.green : lightGrey
                            ),
                          )
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: (size.width - 30) * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chats[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            chats[index]['message'],
                            style: TextStyle(fontSize: 12, color: grey),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: (size.width - 30) * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            chats[index]['time'],
                            style: TextStyle(fontSize: 12, color: grey),
                          ),
                          SizedBox(height: 3,),
                          chats[index]['unread'] != 0
                          ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primary
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                              child: Text(
                                chats[index]['unread'].toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: white
                                ),
                              ),
                            ),
                          )
                          : Icon(Icons.more_horiz, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}