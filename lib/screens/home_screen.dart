import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_helper_app/models/exercise.dart';
import 'package:gym_helper_app/screens/exercise_screen.dart';
import 'package:gym_helper_app/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Exercise> exerciseList = [
    Exercise(id: "id", name: "name", training: "training", howTo: "howTo", imageUrl: "imageUrl"),
    Exercise(id: "id", name: "name", training: "training", howTo: "howTo", imageUrl: "imageUrl"),
    Exercise(id: "id", name: "name", training: "training", howTo: "howTo", imageUrl: "imageUrl"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercicios")),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/user-circle.png")),
                accountName: Text((widget.user.displayName != null)
                    ? widget.user.displayName!
                    : ""),
                accountEmail: Text(widget.user.email!),
            ),
            ListTile(leading: Icon(Icons.logout), title: Text("Logout"),
            onTap: () {
              AuthService().logout();
            },
          ),
        ],
        ),
      ),
      body: ListView(
        children: List.generate(
            exerciseList.length,
                (index) {
                    Exercise exercise = exerciseList[index];
                    return ListTile(
                      title: Text(exercise.name),
                      subtitle: Text(exercise.training),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ExerciseScreen(exercise: exercise),
                        ));
                      },
                    );
                    },
              ),
            ),
      );
  }
}