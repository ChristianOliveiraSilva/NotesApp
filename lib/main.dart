import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/constants.dart';
import 'package:notes/screens/form/form_screen.dart';
import 'package:notes/screens/list/list_screen.dart';
import 'package:notes/screens/home/home_screen.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(
        child: ListScreen(
            annotations: [
              Annotation(name: 'name', text: 'text', date: 'date'),
              Annotation(name: 'name', text: 'text', date: 'date'),
              Annotation(name: 'name', text: 'text', date: 'date'),
              Annotation(name: 'name', text: 'text', date: 'date'),
            ]
        )
      )
    );
  }
}