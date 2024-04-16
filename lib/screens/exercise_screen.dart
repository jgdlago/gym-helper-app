import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text("${exercise.name} | ${exercise.training}")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('teste');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("enviar foto"),
            ),
            const Text("Como fazer?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(exercise.howTo),
            Divider(),
            const Text("Como estou me sentindo?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(feelingList.length, (index) {
                Feeling feeling = feelingList[index];
                return Text(feeling.feeling);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
