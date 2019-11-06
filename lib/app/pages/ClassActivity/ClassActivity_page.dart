import 'package:flutter/material.dart';

class ClassActivityPage extends StatefulWidget {
  final String title;
  const ClassActivityPage({Key key, this.title = "ClassActivity"})
      : super(key: key);

  @override
  _ClassActivityPageState createState() => _ClassActivityPageState();
}

class _ClassActivityPageState extends State<ClassActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text('Várias atividades!')
        ],
      ),
    );
  }
}
