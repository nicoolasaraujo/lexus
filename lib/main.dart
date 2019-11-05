import 'package:flutter/material.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/data/DatabaseHelper.dart';
import 'package:sqflite/sqlite_api.dart';

void main() async{
  var dbHelper = DatabaseHelper();
  await dbHelper.createDatabase();
  
  runApp(AppModule());
}
