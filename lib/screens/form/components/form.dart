import 'package:flutter/material.dart';
import 'package:notes/model/Annotation.dart';

class FormAnnotation extends StatefulWidget {
  const FormAnnotation({this.annotation, required this.updateAnnotation, required this.removeAnnotation, Key? key}) : super(key: key);

  final Annotation? annotation;
  final Function updateAnnotation;
  final Function removeAnnotation;

  isEditing() {
    return annotation != null;
  }

  @override
  _FormAnnotationState createState() => _FormAnnotationState();
}

class _FormAnnotationState extends State<FormAnnotation> {
  final _nameController = TextEditingController();
  final _textController = TextEditingController();
  final _dateController = TextEditingController();

  Annotation? annotation;

  @override
  void initState() {
    super.initState();

    if (widget.annotation == null) {
      annotation = Annotation(name: '', text: '', date: '');
    } else {
      annotation = widget.annotation;
      _nameController.text = widget.annotation!.name;
      _textController.text = widget.annotation!.text;
      _dateController.text = widget.annotation!.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Nome"),
                  onChanged: (text) {
                    setState(() {
                      annotation!.name = text;
                    });
                  },
                ),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(labelText: "Texto"),
                  onChanged: (text) {
                    setState(() {
                      annotation!.text = text;
                    });
                  },
                  maxLines: 3,
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: "Data"),
                  onChanged: (text) {
                    setState(() {
                      annotation!.date = text;
                    });
                  },
                  keyboardType: TextInputType.datetime,
                ),
            ]),
            Row (
              children: <Widget>[
                Expanded(child:
                  ElevatedButton(
                    child: const Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ),
                Expanded(child:
                  ElevatedButton(
                    child: const Text("Excluir"),
                    onPressed: () {
                      if(widget.isEditing()) {
                        widget.removeAnnotation(annotation);
                      }
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    )
                  )
                ),
                Expanded(child:
                  ElevatedButton(
                    child: const Text("Salvar"),
                    onPressed: () {
                      widget.updateAnnotation(annotation);
                      Navigator.pop(context);
                    },
                  )
                )
              ]
            )
          ]
       )
    );
  }
}
