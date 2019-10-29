import 'package:flutter/material.dart';
import 'package:lexus/app/pages/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lexus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primaryColor: Color(0xff2C3E50),
        fontFamily: "Calibre",
      ),
      home: HomeModule(),
    );
  }
}
