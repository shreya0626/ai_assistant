import 'package:ai_assistant/apis/apis.dart';
import 'package:ai_assistant/helper/my_dialog.dart';
import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list = <Message>[
    Message(msg: 'Hello, How can I help you?', msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if(textC.text.trim().isNotEmpty){
      //user
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));
      _scrollDown();

      final res = await APIs.getAnswer(textC.text);

      // ai bot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textC.text = '';
      
    }else{
      MyDialog.info('ask Something!');
    }
  }

  void _scrollDown(){
    scrollC.animateTo(scrollC.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
  
}