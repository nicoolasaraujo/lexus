import 'package:flutter/material.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/data/DatabaseHelper.dart';

void main() async{
  var dbHelper = DatabaseHelper();
  await dbHelper.createDatabase();
  
  runApp(AppModule());
}
