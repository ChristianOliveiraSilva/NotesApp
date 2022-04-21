

class Annotation {
  const Annotation({required this.name, required this.text, required this.date});

  final String name;
  final String text;
  final String date;
}


typedef AnnotationItemChangedCallback = Function(Annotation annotation);