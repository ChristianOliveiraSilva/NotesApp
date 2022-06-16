import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/constants.dart';
import 'package:notes/screens/form/form_screen.dart';
import 'package:notes/screens/list/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Annotation> list = [];

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
                annotations: list,
                updateAnnotation: (Annotation annotation) {
                  setState(() {
                    if (list.indexOf(annotation) == -1) {
                      list.add(annotation);
                    }
                  });
                },
                removeAnnotation: (Annotation annotation) {
                  setState(() {
                    list.remove(annotation);
                  });
                }
            )
        )
    );
  }
}