import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  final Color? color;

  const AppLoadingWidget({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
