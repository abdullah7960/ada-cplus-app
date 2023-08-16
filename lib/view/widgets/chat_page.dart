// chat_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/generate_response.dart';
import '../../model/font_model.dart';
import '../../model/model.dart';
import 'chat_message.dart';



class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages =[];

  late bool isLoading;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }
 void _unfocusKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    final fontSizeModel = Provider.of<FontSizeModel>(context);
    int currentIndex = fontSizeModel.caresolSliderValue;
    //for color from index of moode
    Color containerColor;
    if (currentIndex == 0) {
      containerColor = Colors.red;
    } else if (currentIndex == 1) {
      containerColor = Colors.amber;
    } else if (currentIndex == 2) {
      containerColor = Colors.blue;
    } else if (currentIndex == 3) {
      containerColor = Colors.green;
    } else {
      containerColor = Colors.orange;
    }
    return WillPopScope(
      onWillPop: () async {
        // Check if the keyboard is open
        if (_focusNode.hasFocus) {
          // If the keyboard is open, unfocus it and prevent navigation
          _focusNode.unfocus();
          return false;
        } else {
          // If the keyboard is not open, allow navigation
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: containerColor,
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: (){
            if (_focusNode.hasFocus) {
          // If the keyboard is open, unfocus it and prevent navigation
          _focusNode.unfocus();
          
        } else {
          // If the keyboard is not open, allow navigation
          Navigator.pop(context);
        }
            
          }, 
          icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'ChatGpt',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.6),
          ),
          elevation: 2,
          toolbarHeight: 70,
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            _unfocusKeyboard(context);
          },
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: _buildList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      _buildInput(),
                      _buildSubmit(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
        child:
            IconButton(onPressed: () {
              setState(() {
                //display user input
                _messages.add(ChatMessage(text: _textController.text, chatMessageType: ChatMessageType.user,
              ),
              );
              isLoading = true;
              });
              final input = _textController.text;
              _textController.clear();
              Future.delayed(const Duration(milliseconds: 50))
              .then((value) => _scrollDown());
              //call chat bot api
              generateResponse(input).then((value){
                setState(() {
                  isLoading = false;
                  //display chatnot response
                  _messages.add(ChatMessage(
                    text: value, chatMessageType: ChatMessageType.bot));
                });
              });
              _textController.clear();
              Future.delayed(const Duration(milliseconds:50))
              .then((value) => _scrollDown());
            }, 
            icon: const Icon(Icons.send_rounded),

            ),
            );
  }

  Expanded _buildInput() {
    return Expanded(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextField(
        focusNode: _focusNode,
        maxLines: null, // Set to null for dynamic multiline behavior
        keyboardType: TextInputType.multiline,
        enabled: !isLoading,
        controller: _textController,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: isLoading ? 'Loading . . . ' : 'Write something here . . .',
          filled: true,
          fillColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          border: InputBorder.none,
        ),
      ),
    ));
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: isLoading ?_messages.length +1:_messages.length,
      itemBuilder: (context, index) {
        try{
          var message = _messages[index];
          return ChatMessageWidget(text: message.text, chatMessageType: message.chatMessageType);
        }catch(e){
          return const ChatMessageWidget(text: "Loading ...",
          loading: true ,
          chatMessageType: ChatMessageType.bot);
        }
      });
  }
  void _scrollDown(){
    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}