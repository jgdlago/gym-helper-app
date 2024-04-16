import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gym_helper_app/models/exercise.dart';
import 'package:gym_helper_app/models/feeling.dart';

class ExerciseScreen extends StatelessWidget {
  ExerciseScreen({super.key});

  final Exercise exercise = Exercise(
      id: "id",
      name: "name",
      training: "training",
      howTo: "howTo",
      imageUrl: "imageUrl");

  final List<Feeling> feelingList = [
    Feeling(id: "id", feeling: "feeling", date: "date"),
    Feeling(id: "id", feeling: "feeling", date: "date"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(title: Text("${exercise.name} | ${exercise.training}")),
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
                    onPressed: () {},
                    child: const Text("enviar foto"),
                  ),
                  ElevatedButton(
                      onPressed: () {},
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
