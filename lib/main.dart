import 'package:flutter/material.dart';
import 'package:play_on_task/injection_container.dart' as di;
import 'package:play_on_task/main_app.dart';

void main() async {
  await di.init();
  runApp(const MainApp());
}
