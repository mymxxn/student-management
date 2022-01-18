import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student_management/search.dart';

import 'mj/model/model.dart';

class edit extends StatefulWidget {
  edit({Key? key, required this.student, required this.index})
      : super(key: key);
  Model student;
  int index;

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  final _formKey = GlobalKey<FormState>();

  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[600],
          title: Text(
            widget.student.name!,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: Form(
            child: ListView(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
            Text('          Name:            ',
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            TextFormField(
              initialValue: widget.student.name,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Name',
              ),
              validator: (value) {
                if (value == "") {
                  return "Name required";
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  widget.student.name = (value);
                }
              },
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Text('          Age:               ',
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            TextFormField(
              initialValue: widget.student.age.toString(),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Student Age',
              ),
              validator: (value) {
                if (value == "") {
                  return "Student Age required";
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  widget.student.age = int.parse(value);
                }
              },
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Text('          Domain:        ',
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            TextFormField(
              initialValue: widget.student.domain,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Domain',
              ),
              validator: (value) {
                if (value == "") {
                  return "Domain required";
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  widget.student.domain = (value);
                }
              },
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            Text('         Phone No.:   ',
                style: const TextStyle(color: Colors.black, fontSize: 22)),
            TextFormField(
              initialValue: widget.student.phone.toString(),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Phone No.',
              ),
              validator: (value) {
                if (value == "") {
                  return "Phone No. required";
                }
              },
              onChanged: (value) {
                if (value.isNotEmpty) {
                  widget.student.phone = int.parse(value);
                }
              },
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 300, 0, 0)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,  
                      MaterialPageRoute(builder: (context) => Search()),
                      (route) => false);
                  setState(() {
                    widget.student.save();
                  });
                },
                child: Text('Submit')),
          ],
        )));
  }
}
