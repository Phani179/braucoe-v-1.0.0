
import 'package:flutter/material.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'package:braucoe/utilities/env.dart';

class MailAPI
{
  Future sendMail({required int studentId, required String subject, required String body, required String recieverMail}) async
  {
    final smtpServer = gmail( Env.mailUsername, Env.mailPassword);
    final message = Message()
      ..from = Address( Env.mailUsername, 'BRAUCOE Support')
      ..recipients.add(recieverMail)
      ..subject = subject
      ..text = body
        ;

    try {
      final sendReport = await send(message, smtpServer);
    } on MailerException catch (e) {
      for (var p in e.problems) {
          debugPrint('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}