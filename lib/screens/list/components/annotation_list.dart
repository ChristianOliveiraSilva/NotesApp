import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/list/components/annotation_list_item.dart';

class AnnotationList extends StatelessWidget {
  const AnnotationList({required this.annotations, required this.updateAnnotation, required this.removeAnnotation, Key? key}) : super(key: key);

  final List<Annotation> annotations;
  final Function updateAnnotation;
  final Function removeAnnotation;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: annotations.map((Annotation annotation) {
        return AnnotationListItem(
          annotation: annotation, updateAnnotation: updateAnnotation, removeAnnotation: removeAnnotation
        );
      }).toList(),
    );
  }
}
