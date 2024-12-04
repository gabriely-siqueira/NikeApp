import 'package:flutter/material.dart';
import 'package:nike_app/service/UserService.dart';  // Verifique o caminho da importação
import 'package:nike_app/models/User.dart';  // Verifique o caminho da importação

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/nike_logo.jpg'),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Digite seu email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  // Criando um novo usuário
                  final newUser = User(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  // Adicionando o usuário no serviço
                  UserService.addUser(newUser);

                  // Retorna à tela de login
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 69, 211),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text('Cadastrar'),
              ),
              const SizedBox(height: 10),

              const Text(
                'ou',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_translate),
                label: const Text('Entrar com o Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Já possui cadastro? Faça o login',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
