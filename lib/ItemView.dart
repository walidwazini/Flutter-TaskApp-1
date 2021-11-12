import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_1/ToDoListProvider.dart';

import './ToDo_Model.dart';

class ItemView extends StatefulWidget {
  //const ItemView({Key? key}) : super(key: key);
  ToDo? item;

  ItemView({this.item});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null)
      _textEditingController.text = widget.item!.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item != null ? 'Edit todo' : 'New todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textEditingController,
              onFieldSubmitted: (value) => submit(),
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
            ),
            SizedBox(height: 10),
            SizedBox( width: 120,
              child: ElevatedButton(
                onPressed: submit,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    String description = _textEditingController.text;
    if (description.isNotEmpty) {
      if (widget.item != null) {
        context.read<ToDoListProvider>().editTask(widget.item!, description);
      } else {
        context.read<ToDoListProvider>().addNewItem(description);
      }
      Navigator.pop(context, _textEditingController.text);
    }
  }

//     .then((value) {
// updateTodoDescription(item, value);
// });

}
