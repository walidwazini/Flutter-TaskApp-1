import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ToDo_Model.dart';

 class ToDoItem extends StatelessWidget {
  //const ToDoItem({Key? key}) : super(key: key);
  final ToDo item;
  final Function(ToDo) onTap;
  final Function(ToDo) onLongPress;
  final Function(ToDo) onDismissed;

  ToDoItem({
    required this.item,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        width: 200, height: 70,
        padding: EdgeInsets.only(left: 12),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.black,),
        alignment: Alignment.centerLeft,
      ),
      onDismissed: (direction) => onDismissed(item),
      child: ListTile(
        title: Text(item.description,
          style: TextStyle(decoration: item.complete
              ? TextDecoration.lineThrough
              : null),
        ),
        trailing: Icon(item.complete
            ? Icons.check_box
            : Icons.check_box_outline_blank
        ),
        onTap: () => onTap(item),
        onLongPress: () => onLongPress(item),
      ),
    );
  }
}
