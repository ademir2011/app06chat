import 'dart:io';

import 'package:app06chat/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> singup(
    String name,
    String email,
    String password,
    File? image,
  );
  Future<void> login(
    String email,
    String password,
  );
  Future<void> logout();
}
