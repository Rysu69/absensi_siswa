import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  // tutorial
  void createInitialData() {
    toDoList = [
      ["Check This list", false],
      ["<- Slide this way to delete", false],
    ];
  }

  // load the data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}