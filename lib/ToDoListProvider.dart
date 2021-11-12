import 'package:flutter/material.dart';

import './ToDo_Model.dart';

class ToDoListProvider with ChangeNotifier {
  List<ToDo> items = [
    ToDo('Item 1'),
    ToDo('Item 2'),
    ToDo('Item 3'),
  ];

  // Operations

  void editTask(ToDo item, String description){
    if(description != ''){
      item.description = description;
      notifyListeners();
    }
  }

  void removeItem(ToDo item){
    items.remove(item);
    notifyListeners();
  }

  void addNewItem(String description){
    if(description != ''){
      items.add(ToDo(description));
      notifyListeners();
    }
  }

  void changeCompleteness(ToDo item){
    item.complete = !item.complete;
    notifyListeners();
  }
}