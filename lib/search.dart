import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/add.dart';
import 'package:student_management/mj/model/model.dart';
import 'package:student_management/view.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchText = "";

  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    print;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Add(),
                ));
          },
          child: const Icon(Icons.add),
          foregroundColor: Colors.blueGrey[400],
          backgroundColor: Colors.blueGrey[200],
        ),
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey[600],
          title: const Text(
            "Students",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
              child: TextFormField(
                autofocus: false,
                style: const TextStyle(fontSize: 19.0, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Search Student",
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                ),
                onChanged: (value) {
                  searchText = value;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Hive.box<Model>('records').listenable(),
                builder: (context, Box<Model> box, _) {
                  List<Model> students = box.values.toList();
                  if (box.values.isEmpty) {
                    return const Center(
                      child: Text(
                        'No data!',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    );
                  }
                  List<Model> result = students
                      .where((element) => element.name!
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .toList();
                  print(result.length);

                  return ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View(
                                    student: result[index], index: index))),
                        tileColor: Colors.blueGrey[600],
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    Image.file(File(result[index].imagePath))
                                        .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        title: Text(result[index].name!),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
