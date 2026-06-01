import 'package:flutter/material.dart';

import '../services/storage_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future:
          StorageService.getUser(),

      builder: (context, snapshot) {

        if (!snapshot.hasData) {
          return const Scaffold();
        }

        final user =
            snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title:
                const Text('Профиль'),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Text(
                  'Имя: ${user.name}',
                ),

                Text(
                  'Email: ${user.email}',
                ),

                ElevatedButton(
                  onPressed: () async {

                    await StorageService
                        .logout();

                    if (!context.mounted)
                      return;

                    Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            const LoginScreen(),
                      ),
                    );
                  },

                  child:
                      const Text(
                    'Выйти',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}