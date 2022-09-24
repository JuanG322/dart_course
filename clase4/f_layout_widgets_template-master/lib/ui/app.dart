import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:misiontic_todo/ui/pages/content_page.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tareas",
      theme: ThemeData(primarySwatch: Colors.red),
      home: const ContentPage(),
    );
  }
  
  // Hint: build -> MaterialApp -> ContentPage
}
