import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gym_helper_app/models/exercise.dart';
import 'package:gym_helper_app/models/feeling.dart';
import 'package:image_picker/image_picker.dart';

class ExerciseScreen extends StatelessWidget {
  final Exercise exercise;
  ExerciseScreen({super.key, required this.exercise});

  final List<Feeling> feelingList = [
    Feeling(id: "id", feeling: "feeling", date: "date"),
    Feeling(id: "id", feeling: "feeling", date: "date"),
  ];

    Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print('Caminho da imagem: ${pickedFile.path}');
    } else {
      print('Usuário cancelou a captura de foto.');
    }
  }

    Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('Caminho da imagem escolhida: ${pickedFile.path}');
    } else {
      print('Usuário cancelou a escolha da foto.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Column(children: [
          Text(exercise.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
          ),
          Text(exercise.training,
          style: const TextStyle(fontSize: 15)
          ),
        ]),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32)
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('teste');
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text("enviar foto"),
                  ),
                  ElevatedButton(
                      onPressed: _takePhoto,
                      child: const Text("Tirar foto")
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text("Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(exercise.howTo),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black,),
            ),
            const Text("Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(feelingList.length, (index) {
                Feeling feeling = feelingList[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(feeling.feeling),
                  subtitle: Text(feeling.date),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.redAccent), onPressed: () => print("delete"),),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
