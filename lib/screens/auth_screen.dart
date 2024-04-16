import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool wantLogin = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                      validator: (String? value) {
                        if (value == null) {
                          return "Preencha o campo e-mail";
                        }
                        if (value.length < 5 || !value.contains("@")) {
                          return "E-mail inválido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Senha"),
                      ),
                      obscureText: true,
                      validator: (String? value) {
                        if (value == null) {
                          return "Preencha o campo senha";
                        }
                        if (value.length < 5) {
                          return "senha inválida";
                        }
                        return null;
                        },
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
                              validator: (String? value) {
                                if (value == null) {
                                  return "Preencha o campo senha";
                                }
                                if (value.length < 5) {
                                  return "senha inválida";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text("Nome"),
                              ),
                              validator: (String? value) {
                                if (value == null) {
                                  return "Preencha o campo nome";
                                }
                                if (value.length < 5) {
                                  return "Nome inválido";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                    ),
                    const SizedBox(
                      height: 16
                    ),
                    ElevatedButton(
                        onPressed: () {
                          mainButtonClick();
                        },
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

  mainButtonClick() {
    if(_formKey.currentState!.validate()) {
      print("válido");
    }
          print("inválido");
  }
}