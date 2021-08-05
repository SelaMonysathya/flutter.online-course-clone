
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:online_course_clone/theme/color.dart';
import 'package:online_course_clone/utils/chatDetailPageJson.dart';
import 'package:online_course_clone/utils/chatPageJson.dart';
import 'package:online_course_clone/utils/constant.dart';

class ChatDetailPage extends StatefulWidget {

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
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
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    splashRadius: 25,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios, color: black,),
                  ),
                  SizedBox(width: 5,),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(chats[0]['imageUrl']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(width: 1.5, color: white)
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chats[0]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 11,
                          color: grey
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: Icon(Icons.videocam, color: grey,),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: Icon(Icons.phone_in_talk, color: grey,),
                  ),
                  IconButton(
                    splashRadius: 20,
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, color: grey,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Center(child: Text("Today", style: TextStyle(color: grey, fontSize: 13),)),
              SizedBox(height: 20,),
              Column(
                children: List.generate(chatDetails.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ChatBubble(
                      isMe: chatDetails[index]['isMe'],
                      isSeen: chatDetails[index]['isSeen'],
                      imageUrl: chatDetails[index]['imageUrl'],
                      message: chatDetails[index]['message'],
                      messageNo: chatDetails[index]['messageNo'],
                      dateTime: chatDetails[index]['dateTime'],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: hightLightGrey.withOpacity(0.08),
                blurRadius: 32,
                offset: Offset(0, 4)
              )
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [ 
                Container(
                  height: 50,
                  width: (size.width - 30) * 0.82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: grey),
                    color: white
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 30) * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grey.withOpacity(0.1)
                        ),
                        child: Icon(Icons.add, color: primary,),
                      ),
                      Spacer(),
                      Container(
                        width: (size.width - 30) * 0.56,
                        child: TextField(
                          cursorColor: black.withOpacity(0.5),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message...",
                            hintStyle: TextStyle(color: black.withOpacity(0.5),),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: (size.width - 30) * 0.1,
                        alignment: Alignment.center,
                        child: Text("😎", style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: (size.width - 30) * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primary
                  ),
                  child: Icon(Icons.send, color: white, size: 24,),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool? isMe, isSeen;
  final String? imageUrl, message, dateTime;
  final int? messageNo;

  const ChatBubble({ 
    Key? key, 
    this.isMe, 
    this.isSeen, 
    this.imageUrl, 
    this.message, 
    this.dateTime, 
    this.messageNo 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isMe!) {
      return  Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusMessage(messageNo, isMe),
                color: grey.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message!,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            isSeen!
            ? Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(LineIcons.doubleCheck, size: 14, color: grey,),
                  SizedBox(width: 3,),
                  Text(
                    dateTime!,
                    style: TextStyle(fontSize: 11, color: grey),
                  )
                ],
              ),
            )
            : Container(),
          ],
        ),
      );
    } else {
      return  Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 2),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: getBorderRadiusMessage(messageNo, isMe),
                    color: grey.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message!,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                isSeen!
                ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Icon(LineIcons.doubleCheck, size: 14, color: grey,),
                      SizedBox(width: 3,),
                      Text(
                        dateTime!,
                        style: TextStyle(fontSize: 11, color: grey),
                      )
                    ],
                  ),
                )
                : Container(),
              ],
            ),
          ],
        ),
      );
    }
  }
}