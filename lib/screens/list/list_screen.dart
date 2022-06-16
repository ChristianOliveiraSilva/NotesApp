import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/form/form_screen.dart';
import 'package:notes/screens/list/components/annotation_list.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({required this.annotations, Key? key}) : super(key: key);

  final List<Annotation> annotations;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          leading: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'MENU',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(),
                ),
              );
            },
          ),
        ),
        body: AnnotationList(
          annotations: annotations,
        ),
      );
  }
}


