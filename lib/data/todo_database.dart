
import 'package:hive/hive.dart';

class ToDodatabase {

  List todoList =[];

  final _mybox=Hive.box("MyBox");

  void createFirstData(){
    todoList=[
      ["Create Your Task",false,"Add Description"]
    ];
  }

  void loadData(){
    todoList=_mybox.get("TODO");
  }

  void updateData(){
    _mybox.put("TODO", todoList);
  }
}
