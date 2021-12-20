import 'package:flutter/material.dart';

class ActionsMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;

  const ActionsMenuItem({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 15),
        Text(title),
      ],
    );
  }
}
