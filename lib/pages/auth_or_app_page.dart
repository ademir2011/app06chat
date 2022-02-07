import 'package:app06chat/core/models/chat_user.dart';
import 'package:app06chat/core/services/auth/auth_mock_service.dart';
import 'package:app06chat/pages/auth_page.dart';
import 'package:app06chat/pages/chat_page.dart';
import 'package:app06chat/pages/loanding_page.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}