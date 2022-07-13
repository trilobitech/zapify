import 'package:flutter/material.dart';
import 'package:zapfy/features/home/domain/entity/chat_app.dart';
import 'package:zapfy/features/home/domain/repository/chat_app_repository.dart';

class ChatAppRepository implements IChatAppRepository {
  @override
  Future<List<ChatApp>> getAll() async {
    return [
      ChatApp(
        icon: Icons.whatsapp,
        name: 'WhatsApp',
        brandColor: const Color(0xFF25d366),
        deepLinkPrefix: 'https://wa.me/',
      ),
      ChatApp(
        icon: Icons.telegram,
        name: 'Telegram',
        brandColor: const Color(0xFF0088CC),
        deepLinkPrefix: 'https://t.me/',
      ),
    ];
  }
}
