import 'package:flutter/material.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/data/DatabaseHelper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().createDatabase();
  runApp(AppModule());
}
