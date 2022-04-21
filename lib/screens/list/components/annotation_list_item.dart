import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';

class AnnotationListItem extends StatelessWidget {
  AnnotationListItem({
    required this.annotation,
  }) : super(key: ObjectKey(annotation));

  final Annotation annotation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(annotation.name[0]),
      ),
      title: Text(
        annotation.name
      ),
    );
  }
}