import 'package:flutter/gestures.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
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
  final _nameTextController = TextEditingController();
  final _surnameTextController = TextEditingController();
  final _emailOrPasswordTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  String name = '';
  String surname = '';
  String emailOrPassword = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';

  Future<bool> _onWillPop() async {
    if (AppController.instance.isSignUpCheckboxConfirmed) {
      AppController.instance.checkboxSet();
      return true;
    } else {
      return true;
    }
  }

  Widget _body() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
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
                          child:
                              Image.asset('assets/images/logo.png', height: 40),
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
                          controller: _nameTextController,
                          onChanged: (text) {
                            name = text;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _nameTextController.clear();
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Nome',
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _surnameTextController,
                          onChanged: (text) {
                            name = text;
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _surnameTextController.clear();
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Sobrenome',
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _emailOrPasswordTextController,
                          onChanged: (text) {
                            emailOrPassword = text;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _emailOrPasswordTextController.clear();
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Email ou telefone',
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _passwordTextController,
                          onChanged: (text) {
                            password = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _passwordTextController.clear();
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Senha',
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _confirmPasswordTextController,
                          onChanged: (text) {
                            confirmPassword = text;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _confirmPasswordTextController.clear();
                                },
                                icon: const Icon(Icons.clear)),
                            labelText: 'Confirmar senha',
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
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
                                  const Duration(milliseconds: 300),
                              isReverse: false,
                              selectedBackgroundColor: const Color(0xFF439472),
                              backgroundColor: const Color(0xFF1F1F1F),
                              stripTransitionType:
                                  StripTransitionType.LEFT_TO_RIGHT,
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
                                  fontFamily: 'Roboto')),
                        )
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
                              backgroundColor:
                                  AppController.instance.isDarkTheme
                                      ? MyColors.grayScale
                                      : Colors.white,
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {
                              if (AppController
                                      .instance.isSignUpCheckboxConfirmed ==
                                  true) {
                                AppController.instance.checkboxSet();
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                              }
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
      ),
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
