import 'package:flutter/material.dart';
import 'package:notes/model/Annotation.dart';
import 'package:intl/intl.dart';

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
      annotation = Annotation(name: '', text: '', date: DateTime.now());
    } else {
      annotation = widget.annotation;
      _nameController.text = widget.annotation!.name;
      _textController.text = widget.annotation!.text;
      _dateController.text = DateFormat('dd/MM/yyyy').format(widget.annotation!.date);
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
                  decoration: const InputDecoration(labelText: "Name"),
                  onChanged: (text) {
                    setState(() {
                      annotation!.name = text;
                    });
                  },
                ),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(labelText: "Text"),
                  onChanged: (text) {
                    setState(() {
                      annotation!.text = text;
                    });
                  },
                  maxLines: 3,
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Date"
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101)
                    );
                    
                    if (pickedDate != null) {
                        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate); 

                        setState(() {
                          annotation!.date = pickedDate;
                          _dateController.text = formattedDate;
                        });
                    } else {
                        print("Date is not selected");
                        annotation!.date = DateTime.now();
                        _dateController.text = "";
                    }
                  },
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
