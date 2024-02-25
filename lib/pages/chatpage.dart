import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
        margin:EdgeInsets.only(top: 60.0,left: 20.0, right: 20.0,),
        child: Stack(
          children: [
        Row(
          children:[Icon(icons.arrow_back_ios_new_outlined,color: Color(0xffc199cd),),
            SizedBox(width:90.0,),
            Text(
          "Sudheesh",
          style: TextStyle(
            color: Color(0xffc199cd),
            fontSize: 20.0,
            fontWeight: FontWeight.w500),
        ),],

        ),
            Container()
      ],
      ),
      ),
    );
  }
}
