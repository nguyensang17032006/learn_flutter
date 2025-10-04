import 'package:flutter/material.dart';
import 'package:note_app/Model/items.dart';
import 'package:note_app/Widget/card_model_button.dart';
import 'package:note_app/Widget/card_widget.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Items> items = [];

  void _handleAddTask(String task) {
    final newItem = Items(name: task, id: DateTime.now().toString());
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue,
        title: const Text(
          'To Do App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: items
              .map(
                (item) => CardBody(
                  item: item,
                  index: items.indexOf(item),
                  deleteTask: _handleDeleteTask,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return ModelButton(addTask: _handleAddTask);
            },
          ),
        },
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}
