import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final String destask;
  final bool task;
  Function(bool?)? onchanged;
  Function()?deleteFunction;

  TodoTile(
      {Key? key,
      required this.taskname,
      required this.task,
      required this.onchanged,
      required this.deleteFunction,
      required this.destask})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple[300], borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
                activeColor: Colors.black45, value: task, onChanged: onchanged),
            Column(
              children: [
                Text(taskname,
                    style: TextStyle(
                      fontSize: 17,
                      decoration:
                          task ? TextDecoration.lineThrough : TextDecoration.none,
                    )),
                Text(destask,
                    style: TextStyle(
                      fontSize: 15,
                      decoration:
                      task ? TextDecoration.lineThrough : TextDecoration.none,
                    )),
              ],
            ),
            IconButton(onPressed: deleteFunction, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
