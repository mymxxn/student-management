import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/mj/model/model.dart';
import 'package:student_management/search.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>('records');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Search(),
  ));
}
