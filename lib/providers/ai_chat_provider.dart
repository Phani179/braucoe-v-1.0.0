
import 'package:flutter/material.dart';

import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:braucoe/screens/login/handler.dart';

class AIChatProvider extends ChangeNotifier
{
  List<Content> chat = [
    Content(
      parts: [
        Parts(text: 'Hi, I am ${Handler.studentName}'),
      ],
      role: 'user',
    ),
  ];

  void initializeChat()
  {
    chat = [
      Content(
        parts: [
          Parts(text: 'Hi, I am ${Handler.studentName}'),
        ],
        role: 'user',
      ),
    ];
    // notifyListeners();
  }

  void addMessage(Content content)
  {
    chat.add(content);
    notifyListeners();
  }

}