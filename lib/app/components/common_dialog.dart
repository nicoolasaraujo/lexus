import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAlertDialog extends StatelessWidget {
  final List<Widget> actions;
  final String content;
  final String title;

  CustomAlertDialog(this.content, this.actions, this.title);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: this.actions,
        title: Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: Text(this.content));
  }
}
