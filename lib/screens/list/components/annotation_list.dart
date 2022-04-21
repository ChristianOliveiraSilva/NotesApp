import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/home/home_screen.dart';
import 'package:notes/screens/list/components/annotation_list_item.dart';

class AnnotationList extends StatefulWidget {
  const AnnotationList({required this.annotations, Key? key}) : super(key: key);

  final List<Annotation> annotations;

  @override
  _AnnotationListState createState() => _AnnotationListState();
}

class _AnnotationListState extends State<AnnotationList> {

  void _handleCartChanged(Annotation annotation) {

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: widget.annotations.map((Annotation annotation) {
        return AnnotationListItem(
          annotation: annotation
        );
      }).toList(),
    );
  }
}
