import 'package:flutter/gestures.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_widgets.dart';
import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = '';
  String surname = '';
  String emailOrPassword = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';

  Widget _body() {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SafeArea(
              child: ScrollConfiguration(
                behavior: ScrollRemove(),
                child: ListView(children: [
                  Container(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: SvgPicture.asset('assets/images/logo.svg',
                            height: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Cadastro',
                          style: TextStyle(

                              //If-else pra trocar a cor do texto do botão de
                              //"Cadastrar" para deixar mais visível no Dark Mode.
                              color: AppController.instance.isDarkTheme
                                  ? MyColors.primary[300]
                                  : MyColors.primary,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 80),
                  Column(
                    children: [
                      //Campo de texto para o nome
                      TextField(
                        onChanged: (text) {
                          name = text;
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          emailOrPassword = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email ou telefone',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          confirmPassword = text;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirmar senha',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                                Navigator.of(context).pushNamed('/tou');
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
                            text: " Política de Privacidade",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed('/ppp');
                              },
                          ),
                        ]),
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Flexible(
                          child: AnimatedButton.strip(
                              isSelected: AppController
                                  .instance.isSignUpCheckboxConfirmed,
                              animationDuration:
                                  const Duration(milliseconds: 350),
                              isReverse: true,
                              stripTransitionType:
                                  StripTransitionType.LEFT_TO_RIGHT,
                              selectedBackgroundColor: const Color(0xFF439472),
                              backgroundColor: const Color(0xFF1F1F1F),
                              selectedTextColor: AppController
                                      .instance.isSignUpCheckboxConfirmed
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color(0xFF959595),
                              animatedOn: AnimatedOn.onHover,
                              onPress: () {
                                AppController.instance.isSignUpCheckboxConfirmed
                                    ? Navigator.of(context)
                                        .pushNamed('/finalsignup')
                                    : _showCheckboxFalseAlert();
                              },
                              text: 'Cadastrar',
                              textStyle: TextStyle(
                                  color: AppController
                                          .instance.isSignUpCheckboxConfirmed
                                      ? Colors.white
                                      : MyColors.darkGrayScale[200],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto')))
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        //Botão pressionável de "Cadastrar"
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            shadowColor:
                                const Color.fromARGB(216, 255, 255, 255),
                            //If-else pra trocar a cor do botão "Cadastrar" para
                            //deixar adaptável ao Dark Mode.
                            backgroundColor: AppController.instance.isDarkTheme
                                ? MyColors.grayScale
                                : Colors.white,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {
                            AppController.instance.checkboxSet();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Voltar',
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
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        _body(),
      ]),
    ));
  }

//Área de funções
  void _showCheckboxFalseAlert() {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        animationType: DialogTransitionType.sizeFade,
        duration: const Duration(milliseconds: 200),
        builder: (context) {
          return ClassicGeneralDialogWidget(
            titleText: 'Por favor',
            contentText: 'Concorde com os termos antes de se cadastrar!',
            positiveText: 'Fechar',
            onPositiveClick: () {
              Navigator.pop(context);
            },
            positiveTextStyle: const TextStyle(color: MyColors.primary),
          );
        });
  }

//Funções a serem usadas no futuro
  void _showInsufficientCredentialsAlert() {}

  void _showInvalidCredentialsAlert() {}

  void _showIncorrectPasswordAlert() {}
}
