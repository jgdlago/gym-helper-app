import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool wantLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset("assets/logo.png", height: 158),
                    const Text(
                      "GymAPP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(
                      height: 32
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("E-mail"),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Senha"),
                      ),
                      obscureText: true,
                    ),
                    Visibility(
                        visible: !wantLogin,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Confirmação da senha"),
                              ),
                              obscureText: true,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Nome"),
                              ),
                            ),
                          ],
                        ),
                    ),
                    const SizedBox(
                      height: 16
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text((wantLogin)? "Entrar" : "Cadastrar")
                    ),
                    const Divider(),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            wantLogin = !wantLogin;
                          });
                        },
                        child: Text((wantLogin)? "Ainda não tem uma conta?" : "Já tem uma conta?")
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}