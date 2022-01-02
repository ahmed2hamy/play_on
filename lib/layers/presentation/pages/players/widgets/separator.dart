import 'package:flutter/material.dart';
import 'package:play_on/constants/constants.dart';

class Separator extends StatelessWidget {
  final double height;
  final Color color;

  const Separator({
    Key? key,
    this.height = 1,
    this.color = kBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(height: height, color: kBorderColor);
  }
}
