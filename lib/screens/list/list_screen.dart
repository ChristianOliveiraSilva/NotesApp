import 'package:flutter/material.dart';
import 'package:notes/model/Annotation.dart';
import 'package:notes/screens/form/form_screen.dart';
import 'package:notes/screens/list/components/annotation_list.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({required this.annotations, required this.updateAnnotation, required this.removeAnnotation, Key? key}) : super(key: key);

  final List<Annotation> annotations;
  final Function updateAnnotation;
  final Function removeAnnotation;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Notes 2.0'),
          leading: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'MENU',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(updateAnnotation: updateAnnotation, removeAnnotation: removeAnnotation),
                ),
              );
            },
          ),
        ),
        body: AnnotationList(
            annotations: annotations,
            updateAnnotation: updateAnnotation,
            removeAnnotation: removeAnnotation
        ),
      );
  }
}


