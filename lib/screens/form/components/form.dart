import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/list/list_screen.dart';


class Form extends StatefulWidget {
  Form({this.annotation, Key? key}) : super(key: key);

  Annotation? annotation;

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {

  void _handleCartChanged(Annotation annotation) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListScreen(annotations: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Text('asdasdd');
  }
}
