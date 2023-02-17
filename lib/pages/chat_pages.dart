import 'package:chat/constant.dart';
import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chat_cubit/chat_cubit.dart';
import '../chat_cubit/chat_state.dart';
import '../widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();
  List<Message> messagesList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                kLogo,
                height: 50,
                width: 80,
              ),
              const Text(
                'Chat',
              ),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child:
                BlocBuilder<ChatCubit, ChatStates>(builder: (context, state) {
              var messagesList =
                  BlocProvider.of<ChatCubit>(context).messagesList;
              return ListView.builder(
                reverse: true,
                controller: _controller,
                itemBuilder: (context, index) {
                  return messagesList[index].id == email
                      ? ChatBubble(
                          message: messagesList[index],
                        )
                      : ChatBubbleForFriend(message: messagesList[index]);
                },
                itemCount: messagesList.length,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                print(email);
                ChatCubit.get(context)
                    .sendMessages(message: data, email: email.toString());
                controller.clear();
                _controller.animateTo(
                  _controller.position.maxScrollExtent,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: const Icon(
                  Icons.send,
                  color: primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: primaryColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
