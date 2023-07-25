import 'package:flutter/gestures.dart';
import 'custom_widgets.dart';
import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String name = '';
  String surname = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';

  Widget _body() {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'assets/images/signup_logo.png',
                        height: 40,
                      ),
                    ),
                    Text(
                      'Cadastro',
                      style: TextStyle(

                          //If-else pra trocar a cor do texto do botão de
                          //"Cadastrar" para deixar mais visível no Dark Mode.
                          color: AppController.instance.isDarkTheme
                              ? MyColors.primary[300]
                              : MyColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto'),
                    ),
                    Container(
                      height: 32,
                    ),
                  ],
                ),
                Container(height: 80),
                Column(
                  children: [
                    //Campo de texto para o email
                    TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Sobrenome',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email ou telefone',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        name = text;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Confirmar senha',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(children: [
                  const SignupCheckbox(),
                  Expanded(
                    child: RichText(
                      overflow: TextOverflow.clip,
                      text: TextSpan(text: "", children: [
                        TextSpan(
                          text: "Ao se cadastrar, você concorda com nossos",
                          style: TextStyle(
                              color: AppController.instance.isDarkTheme
                                  ? MyColors.darkGrayScale[50]
                                  : MyColors.darkGrayScale[700]),
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: AppController.instance.isDarkTheme
                                  ? MyColors.lightBlueScale[200]
                                  : MyColors.lightBlueScale[700]),
                          text: " Termos de Uso",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Ta funfando o service terms");
                            },
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: AppController.instance.isDarkTheme
                                  ? MyColors.darkGrayScale[50]
                                  : MyColors.darkGrayScale[700]),
                          text: " e",
                        ),
                        TextSpan(
                          style: TextStyle(
                              color: AppController.instance.isDarkTheme
                                  ? MyColors.lightBlueScale[200]
                                  : MyColors.lightBlueScale[700]),
                          text: " Privacidade",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Ta funfando a privcay");
                              print(AppController.instance.isDarkTheme);
                            },
                        ),
                      ]),
                    ),
                    // child: Text(
                    //   "Ao se cadastrar, você concorda com nossos Termos de Uso e Política de Privacidade",
                    //   overflow: TextOverflow.clip,
                    //   style: TextStyle(
                    //     color: grayScale.shade800,
                    //     fontFamily: 'Roboto',
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                  ),
                ]),
                const SizedBox(
                  height: 50,
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _body(),
    ]));
  }
}
