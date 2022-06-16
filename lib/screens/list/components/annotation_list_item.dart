import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/form/form_screen.dart';

class AnnotationListItem extends StatelessWidget {
  AnnotationListItem({
    required this.annotation,
    required this.updateAnnotation,
    required this.removeAnnotation
  }) : super(key: ObjectKey(annotation));

  final Annotation annotation;
  final Function updateAnnotation;
  final Function removeAnnotation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormScreen(annotation: annotation, updateAnnotation: updateAnnotation, removeAnnotation: removeAnnotation)
          ),
        );
      },
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(annotation.name[0].toUpperCase()),
      ),
      title: Text(
        annotation.name
      ),
    );
  }
}