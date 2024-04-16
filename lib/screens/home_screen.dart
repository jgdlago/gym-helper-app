import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_helper_app/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bem vindo!")),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(leading: Icon(Icons.logout), title: Text("Logout"),
            onTap: () {
              AuthService().logout();
            },
          ),
        ],
        ),
      ),
      );
  }
}