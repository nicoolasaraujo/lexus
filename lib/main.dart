import 'package:flutter/material.dart';
import 'package:lexus/app/app_module.dart';
import 'package:lexus/app/data/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
  await Sqflite.devSetDebugModeOn(true);
  var dbHelper = DatabaseHelper();
  await dbHelper.createDatabase();
  
  runApp(AppModule());
}
