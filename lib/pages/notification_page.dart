import 'package:app06chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Notificações'),
      ),
      body: ListView.builder(
          itemCount: service.itemCount,
          itemBuilder: (ctx, i) {
            return ListTile(
              title: Text(items[i].body),
              subtitle: Text(
                items[i].body,
              ),
              onTap: () => service.remove(i),
            );
          }),
    );
  }
}
