import 'package:flutter/material.dart';

class GoUpTheListFAB extends StatelessWidget {
  final ScrollController listController;

  const GoUpTheListFAB({
    Key? key,
    required this.listController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: ElevatedButton(
        onPressed: () => listController.animateTo(
          listController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
        ),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: const Size.fromRadius(20),
          elevation: 2,
          primary: Colors.white,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_upward,
            color: Colors.black,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}
