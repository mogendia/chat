import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class ChatBubble extends StatelessWidget {
   const ChatBubble({super.key,
    required this.message,
  });
 final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 18,right: 28,top: 28,bottom: 28),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: primaryColor,
        ),
        child:  Text(message.message,style: const TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
class ChatBubbleForFriend extends StatelessWidget {
   const ChatBubbleForFriend({super.key,
    required this.message,
  });
 final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 18,right: 28,top: 28,bottom: 28),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),

        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          //color:Color(0xff006D84),
          color:Color(0xff778899),
        ),
        child:  Text(message.message,style: const TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
