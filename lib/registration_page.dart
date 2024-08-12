import 'package:flutter/material.dart';
import 'authentication_service.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nomCompletController = TextEditingController();
    final TextEditingController adresseController = TextEditingController();
    final TextEditingController telephoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nomCompletController,
              decoration: const InputDecoration(
                labelText: 'Nom Complet',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            TextField(
              controller: telephoneController,
              decoration: const InputDecoration(
                labelText: 'Téléphone',
              ),
            ),
            TextField(
              controller: adresseController,
              decoration: const InputDecoration(
                labelText: 'Adresse',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                register(
                  emailController.text,
                  passwordController.text,
                  nomCompletController.text,
                  adresseController.text,
                  telephoneController.text,
                  context,
                );
              },
              child: const Text('S\'inscrire'),
            ),
          ],
        ),
      ),
    );
  }
}
