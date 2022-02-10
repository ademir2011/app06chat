import 'package:app06chat/components/message_bubble.dart';
import 'package:app06chat/core/models/chat_message.dart';
import 'package:app06chat/core/services/auth/auth_service.dart';
import 'package:app06chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messagesStream(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('Sem dados. Vasmo conversar ?'));
          } else {
            final msgs = snapshot.data!;
            return ListView.builder(
              reverse: true,
              itemCount: msgs.length,
              itemBuilder: (ctx, i) {
                return MessageBubble(
                    key: ValueKey(msgs[i].id),
                    message: msgs[i],
                    belongsToCurrentUser: currentUser?.id == msgs[i].userId);
              },
            );
          }
        });
  }
}
