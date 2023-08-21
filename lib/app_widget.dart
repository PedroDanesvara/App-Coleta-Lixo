import 'package:app_coleta_lixo/final_signup_page.dart';
import 'package:app_coleta_lixo/privacy_policy_page.dart';
import 'package:app_coleta_lixo/terms_of_use_page.dart';

import 'app_controller.dart';
import 'colors.dart';
import 'package:app_coleta_lixo/app/pages/home/home_page.dart';
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
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: MyColors.primary,
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light),

            //Rota inicial temporária por enquanto que não tem página inicial
            initialRoute: '/login',
            routes: {
              '/login': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
              '/signup': (context) => const SignUpPage(),
              '/finalsignup': (context) => const FinalSignUpPage(),
              '/ppp': (context) => const PrivacyPolicyPage(),
              '/tou': (context) => const TermsOfUsePage(),
            });
      },
    );
  }
}
