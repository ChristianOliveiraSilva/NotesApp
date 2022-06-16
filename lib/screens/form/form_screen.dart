import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/form/components/form.dart';

class FormScreen extends StatelessWidget {
  FormScreen({this.annotation, Key? key}) : super(key: key);

  Annotation? annotation;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(annotation == null ? 'Adicionar' : 'Editar'),
        ),
        body: const Text("data")
      );
  }
}


