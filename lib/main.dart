import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/constants.dart';
import 'package:notes/screens/form/form_screen.dart';
import 'package:notes/screens/list/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
      ),
      home: Container(
        child: ListScreen(
            annotations: [
              Annotation(name: 'Título 1', text: 'text 1', date: 'date'),
              Annotation(name: 'Título 2', text: 'text 2', date: 'date'),
              Annotation(name: 'Título 3', text: 'text 3', date: 'date'),
              Annotation(name: 'Título 4', text: 'text 4', date: 'date'),
            ]
        )
      )
    );
  }
}