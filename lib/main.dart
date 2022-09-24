import 'package:flutter/material.dart';
import 'package:notes/model/Annotation.dart';
import 'package:notes/constants.dart';
import 'package:notes/provider/app_preferences.dart';
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
  initState() {
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    final List<Annotation> l = await DBAbstraction.getList();
    setState(() {
      list = l;
    });
  }

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
        home: ListScreen(
            annotations: list,
            updateAnnotation: (Annotation annotation) {
              setState(() {
                if (!list.contains(annotation)) {
                  list.add(annotation);
                }
                DBAbstraction.saveList(list: list);
              });
            },
            removeAnnotation: (Annotation annotation) {
              setState(() {
                list.remove(annotation);
                DBAbstraction.saveList(list: list);
              });
            }
        )
    );
  }
}