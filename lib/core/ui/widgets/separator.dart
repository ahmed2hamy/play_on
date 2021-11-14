import 'package:flutter/material.dart';
import 'package:play_on_task/constants/constants.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, color: kBorderColor);
  }
}
