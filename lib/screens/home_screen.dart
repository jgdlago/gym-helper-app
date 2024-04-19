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
    Exercise(id: "1", name: "Supino reto", training: "Treino A", howTo: "Contrair as escápulas, logo apos estufar o peito e realizar o movimento cadenciado", imageUrl: "imageUrl"),
    Exercise(id: "2", name: "Rosca direta", training: "Treino B", howTo: "Base firme com os braços a frente do tronco. Não subir o braço totalmente", imageUrl: "imageUrl"),
    Exercise(id: "3", name: "Leg Press", training: "Treino C", howTo: "Joelhos na largura dos ombros, ", imageUrl: "imageUrl"),
    Exercise(id: "1", name: "Triceps corda", training: "Treino A", howTo: "Inclinação de 30º", imageUrl: "imageUrl"),
    Exercise(id: "2", name: "Stiff", training: "Treino B", howTo: "Focar na ativação do posterior e firmar o abdomen", imageUrl: "imageUrl"),
    Exercise(id: "3", name: "Remada", training: "Treino C", howTo: "Coluna reta, firmar o abdomen e contrair as escapulas ", imageUrl: "imageUrl"),
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