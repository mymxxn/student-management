// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_management/mj/model/model.dart';
import 'package:student_management/search.dart';

import 'edit.dart';

class View extends StatelessWidget {
  View({
    Key? key,
    required this.student,required this.index
  }) : super(key: key);
  Box<Model> box = Hive.box<Model>('records');
  Model student;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[600],
          title: Text(
            student.name!,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: Form(
            child: ListView(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
            CircleAvatar(
            backgroundColor: Colors.grey,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                
                image: DecorationImage(
                  image:Image.file(File(student.imagePath)).image,
                  fit: BoxFit.fill,
                  
                ),
              ),
            ),
          ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
            Text('          Name:            ' + student.name!,
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Text('          Age:               ' + student.age.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Text('          Domain:        ' + student.domain.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Text('         Phone No.:   ' + student.phone.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            const Padding(padding: EdgeInsets.fromLTRB(0, 300, 0, 0)),
            FloatingActionButton(
              onPressed: () async {
                await box.deleteAt(index);
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ));
              },
              child: const Icon(Icons.delete),
              foregroundColor: Colors.blueGrey[400],
              backgroundColor: Colors.blueGrey[200],
            ),
            FloatingActionButton(heroTag: null,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                       builder: (context) => edit(student: student,index: index,),
                    ));
              },
              child: Text('Update'),
              foregroundColor: Colors.blueGrey[400],
              backgroundColor: Colors.blueGrey[200],
            ),
          ],
        )));
  }
}
