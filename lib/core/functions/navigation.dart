import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  push(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pushandremoveuntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }
}
