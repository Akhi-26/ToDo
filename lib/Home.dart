import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/Util/todo_tile.dart';
import 'package:to_do/data/todo_database.dart';

import 'Util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box("MyBox");
  ToDodatabase db = ToDodatabase();

  @override
  void initState() {
    if (_mybox.get("TODO") == null) {
      db.createFirstData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  final _descontroller = TextEditingController();

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false, _descontroller.text]);
      _controller.clear();
      _descontroller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveTask,
            descontroller: _descontroller,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "TO DO",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskname: db.todoList[index][0],
              task: db.todoList[index][1],
              onchanged: (value) => checkboxChanged(value, index),
              deleteFunction: () => deleteTask(index),
              destask: db.todoList[index][2],
            );
          },
        ),
      ),
    );
  }
}
