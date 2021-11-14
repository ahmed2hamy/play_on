import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';

class Dialogs {
  static buildSnackBar(
    BuildContext context,
    String? text, {
    int duration = 3,
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(text ?? Strings.defaultErrorMessage),
      duration: Duration(seconds: duration),
    );

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      print("SnackBar: [${text ?? Strings.defaultErrorMessage}]");
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
