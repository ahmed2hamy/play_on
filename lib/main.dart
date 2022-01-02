import 'package:flutter/material.dart';
import 'package:play_on/injection_container.dart' as di;
import 'package:play_on/main_app.dart';

void main() async {
  await di.init();
  runApp(const MainApp());
}
