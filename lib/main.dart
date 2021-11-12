import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ToDo_Model.dart';
import './ToDoItem.dart';
import './ToDoListProvider.dart';
import './ItemView.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ToDoListProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<ToDo> items = List<ToDo>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-Do App 2021'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: goToNewItemView,
        ),
        body: Consumer<ToDoListProvider>(
          builder: (context, provider, child){
            return provider.items.isNotEmpty ?  ListView.builder(
              itemCount: provider.items.length,
              itemBuilder: (context, index) {
                return ToDoItem(
                  onTap: provider.changeCompleteness,
                  item: provider.items[index],
                  onLongPress: goToEditItemView,
                  onDismissed: provider.removeItem,
                );
              },
            ) : Center( child: Text('No item here'),) ;
          },
        ),
    );
  }

  void goToNewItemView(){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return ItemView();
        }
    ));
    //     .then((value) {
    //   addNewTodo(value);
    // });
  }

  void goToEditItemView(ToDo item){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return ItemView(item: item);
        }
    ));
  }
}

class ToDoTask extends StatelessWidget {
  //const ToDoTask({Key? key}) : super(key: key);
  final ToDo item;
  final Function(ToDo) onTap;
  final Function(ToDo) onLongPress;
  final Function(ToDo) onDismissed;

  ToDoTask({
    required this.item,
    required this.onTap,
    required this.onDismissed,
    required this.onLongPress
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 12),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white,),
        alignment: Alignment.centerLeft,
      ),
      child: Text('Hello'),
    );
  }
}

