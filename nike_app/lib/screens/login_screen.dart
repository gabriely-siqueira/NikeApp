import 'package:flutter/material.dart';
import 'package:nike_app/main.dart';
import 'package:nike_app/service/UserService.dart';
import '../screens/home_screen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Digite seu email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de senha
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
                  final user = UserService.getUserByEmail(emailController.text);

                  if (user != null && user.password == passwordController.text) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(email: emailController.text), // Passa o e-mail para a HomeScreen
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email ou senha inválidos')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 69, 211), // Cor de fundo do botão
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255), // Cor do texto do botão
                ),
                child: const Text('Acessar'),
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
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Ainda não possui cadastro? Cadastre-se',
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