import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
// import 'package:chat_app/fbm_vapid_key.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // since it's not recommended to turn the initState to the async, we need to use a helper method
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    fcm.requestPermission();

    // with the help of this 'token' we are able to send a push notification to this specific device
    // final token = await fcm.getToken(vapidKey: fbmVapidKey);

    // here we can send a push notification manually to all devices subscribe to the 'chat' topic
    fcm.subscribeToTopic('chat');

    // to send notifications automatically we need to use the 'Functions' feature in our Firebase backend, which requires us to upgrade to a paid plan.
    // added file 'index.js' to the lib directory in case one day I wanted to deploy it to the Firebase to send push notifications automatically.
  }

  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
        title: const Text('FlutterChat'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
