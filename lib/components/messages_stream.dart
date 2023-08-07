import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arzu_chat/components/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

// shows all messages coming from everyone

class MessagesStream extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  User? loggedInUser = FirebaseAuth.instance.currentUser; //FireBase User

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // if no data
          return CircularProgressIndicator();
        } else {
          final messages = snapshot.data?.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages!) {
            final messageText = message.get('message');
            final messageSender = message.get('sender');

            final loggedinUserEmail = loggedInUser?.email;

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: messageSender == loggedinUserEmail,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
