import 'package:flutter/material.dart';
import 'package:to_do/Util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final descontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {Key? key,
      required this.controller,
      required this.onCancel,
      required this.onSave,
      required this.descontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Add New Task",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: descontroller,
              decoration: const InputDecoration(
                hintText: "Add description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: "Save",
                  onpressed: onSave,
                ),
                const SizedBox(
                  width: 8,
                ),
                Button(text: "Cancel", onpressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
