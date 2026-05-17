import 'package:flutter/material.dart';
import 'package:to_do_app/screen_1.dart';
void main() {
  runApp(Todo());
}
class Todo extends StatelessWidget {
  const Todo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      home: Screen1(),
    );
  }
}