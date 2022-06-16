import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/form/components/form.dart';

class FormScreen extends StatelessWidget {
  FormScreen({this.annotation, required this.updateAnnotation, required this.removeAnnotation, Key? key}) : super(key: key);

  Annotation? annotation;
  final Function updateAnnotation;
  final Function removeAnnotation;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(annotation == null ? 'Adicionar' : 'Editar'),
        ),
        body: FormAnnotation(annotation: annotation, updateAnnotation: updateAnnotation, removeAnnotation: removeAnnotation)
      );
  }
}