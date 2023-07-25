import 'app_controller.dart';
import 'colors.dart';
import 'home_page.dart';
import 'signup_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
            theme: ThemeData(
                primarySwatch: MyColors.primary,
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: '/',
            routes: {
              '/': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
              '/signup': (context) => const SignupPage(),
            });
      },
    );
  }
}
