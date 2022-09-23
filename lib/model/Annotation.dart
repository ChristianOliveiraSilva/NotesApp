
class Annotation {
  Annotation({required this.name, required this.text, required this.date});

  String name;
  String text;
  DateTime date;
}

// typedef AnnotationItemChangedCallback = Function(Annotation annotation);