

import 'dart:math';

int generateOTP()
{
  int otp = Random().nextInt(8999) + 1000;
  return otp;
}