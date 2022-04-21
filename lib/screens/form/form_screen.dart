import 'package:flutter/material.dart';
import 'package:notes/Annotation.dart';
import 'package:notes/screens/home/home_screen.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({required this.annotations, Key? key}) : super(key: key);

  final List<Annotation> annotations;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Adicionar'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'VOLTA',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ),
        body: const Text("data")
      );
  }
}


