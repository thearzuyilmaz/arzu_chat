import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String? text;
  final String? sender;
  late bool isMe;

  MessageBubble({this.text, this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender!,
            style: TextStyle(fontSize: 10.0, color: Colors.black54),
          ),
          Container(
            constraints:
                BoxConstraints(maxWidth: 200.0), // Set the maximum width
            decoration: BoxDecoration(
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
              color: isMe ? Colors.deepPurpleAccent : Colors.deepOrangeAccent,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text!,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
