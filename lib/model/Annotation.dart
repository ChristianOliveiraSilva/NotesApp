
class Annotation {
  Annotation({
    required this.name,
    required this.text,
    required this.date
  });

  String name;
  String text;
  DateTime date;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'text': text,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'Dog{name: $name, text: $text, date: $date}';
  }
}

// typedef AnnotationItemChangedCallback = Function(Annotation annotation);