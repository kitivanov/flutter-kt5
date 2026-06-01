import 'package:flutter/material.dart';

import '../models/user.dart';
import '../services/storage_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final nameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  Future<void> login() async {

    final user = User(
      name: nameController.text,
      email: emailController.text,
    );

    await StorageService.saveUser(user);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
          AppBar(title: const Text('Вход')),

      body: Padding(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
                  nameController,
              decoration:
                  const InputDecoration(
                labelText: 'Имя',
              ),
            ),

            TextField(
              controller:
                  emailController,
              decoration:
                  const InputDecoration(
                labelText: 'Email',
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: login,
              child:
                  const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}