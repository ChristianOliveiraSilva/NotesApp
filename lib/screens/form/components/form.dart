import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/list/list_screen.dart';

class FormAnnotation extends StatefulWidget {
  FormAnnotation({this.annotation, required this.updateAnnotation, required this.removeAnnotation, Key? key}) : super(key: key);

  Annotation? annotation;
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

    if(widget.annotation == null){
      annotation = new Annotation(name: '', text: '', date: '');
    } else {
      annotation = widget.annotation;
      _nameController.text = widget.annotation!.name;
      _textController.text = widget.annotation!.text;
      _dateController.text = widget.annotation!.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                setState(() {
                  annotation!.name = text;
                });
              },
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Texto"),
              onChanged: (text) {
                setState(() {
                  annotation!.text = text;
                });
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: "Data"),
              onChanged: (text) {
                setState(() {
                  annotation!.date = text;
                });
              },
              keyboardType: TextInputType.datetime,
            ),
            Divider(),
            Row (
              children: <Widget>[
                Expanded(child:
                  ElevatedButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ),
                Expanded(child:
                  ElevatedButton(
                    child: Text("Excluir"),
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
                    child: Text("Salvar"),
                    onPressed: () {
                      widget.updateAnnotation(annotation);
                      Navigator.pop(context);
                    },
                  )
                )
              ]
            )
          ],
        ));
  }
}
