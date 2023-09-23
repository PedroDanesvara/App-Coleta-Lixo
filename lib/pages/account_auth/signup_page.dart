import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import '../../providers/state_controller.dart';
import '../../services/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static String name = '',
      surname = '',
      email = '',
      phone = '',
      password = '',
      confirmPassword = '';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameTextController = TextEditingController(),
      _surnameTextController = TextEditingController(),
      _emailTextController = TextEditingController(),
      _phoneNumberTextController = TextEditingController(),
      _passwordTextController = TextEditingController(),
      _confirmPasswordTextController = TextEditingController();

  Future<bool> _onWillPop() async {
    AppController.instance.isSignUpCheckboxConfirmed = false;
    return true;
  }

  Widget _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: AnimatedBuilder(
            animation: AppController.instance,
            builder: (context, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: SafeArea(
                    child: ScrollConfiguration(
                      behavior: ScrollRemove(),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Container(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  'assets/images/svg_icons/logo.svg',
                                  height: 40,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  'Cadastro',
                                  style: TextStyle(
                                    //If-else pra trocar a cor do texto do botão de
                                    //"Cadastrar" para deixar mais visível no Dark Mode.
                                    color: notifier.darkTheme
                                        ? MyColors.primary[300]
                                        : MyColors.primary,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 80,
                          ),
                          Column(
                            children: [
                              //Campo de texto para o nome
                              TextField(
                                controller: _nameTextController,
                                onChanged: (text) {
                                  SignUpPage.name = text;
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
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _surnameTextController,
                                onChanged: (text) {
                                  SignUpPage.surname = text;
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
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _emailTextController,
                                onChanged: (text) {
                                  SignUpPage.email = text;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _emailTextController.clear();
                                      },
                                      icon: const Icon(Icons.clear)),
                                  labelText: 'Email',
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _phoneNumberTextController,
                                onChanged: (text) {
                                  SignUpPage.phone = text;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _phoneNumberTextController.clear();
                                      },
                                      icon: const Icon(Icons.clear)),
                                  labelText: 'Número de telefone',
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _passwordTextController,
                                onChanged: (text) {
                                  SignUpPage.password = text;
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
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _confirmPasswordTextController,
                                onChanged: (text) {
                                  SignUpPage.confirmPassword = text;
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
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              const SignupCheckbox(),
                              Expanded(
                                child: RichText(
                                  overflow: TextOverflow.clip,
                                  text: TextSpan(
                                    text: "",
                                    children: [
                                      TextSpan(
                                        text:
                                            "Ao se cadastrar, você concorda com nossos",
                                        style: TextStyle(
                                            color: notifier.darkTheme
                                                ? MyColors.darkGrayScale[50]
                                                : MyColors.darkGrayScale[700]),
                                      ),
                                      TextSpan(
                                        style: TextStyle(
                                            color: notifier.darkTheme
                                                ? MyColors.lightBlueScale[200]
                                                : MyColors.lightBlueScale[700]),
                                        text: " Termos de Uso",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context)
                                                .pushNamed('/tou');
                                          },
                                      ),
                                      TextSpan(
                                        style: TextStyle(
                                            color: notifier.darkTheme
                                                ? MyColors.darkGrayScale[50]
                                                : MyColors.darkGrayScale[700]),
                                        text: " e",
                                      ),
                                      TextSpan(
                                        style: TextStyle(
                                            color: notifier.darkTheme
                                                ? MyColors.lightBlueScale[200]
                                                : MyColors.lightBlueScale[700]),
                                        text: " Política de Privacidade",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context)
                                                .pushNamed('/ppp');
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: AnimatedButton(
                                  isSelected: AppController
                                      .instance.isSignUpCheckboxConfirmed,
                                  animationDuration: const Duration(
                                    milliseconds: 300,
                                  ),
                                  isReverse: false,
                                  selectedBackgroundColor:
                                      const Color(0xFF439472),
                                  backgroundColor: const Color(0xFF1F1F1F),
                                  transitionType: TransitionType.LEFT_TO_RIGHT,
                                  selectedTextColor: AppController
                                          .instance.isSignUpCheckboxConfirmed
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : const Color(0xFF959595),
                                  onPress: () {
                                    AppController
                                            .instance.isSignUpCheckboxConfirmed
                                        ? Navigator.of(context)
                                            .pushNamed('/finalsignup')
                                        : _showCheckboxFalseAlert();
                                  },
                                  text: 'Cadastrar',
                                  animatedOn: AnimatedOn.onHover,
                                  textStyle: TextStyle(
                                    color: AppController
                                            .instance.isSignUpCheckboxConfirmed
                                        ? Colors.white
                                        : MyColors.darkGrayScale[200],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
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
                                    shadowColor: const Color.fromARGB(
                                        216, 255, 255, 255),
                                    //If-else pra trocar a cor do botão "Cadastrar" para
                                    //deixar adaptável ao Dark Mode.
                                    backgroundColor: notifier.darkTheme
                                        ? MyColors.grayScale
                                        : Colors.white,
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  onPressed: () {
                                    if (AppController
                                        .instance.isSignUpCheckboxConfirmed) {
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
                                      //"Voltar" para deixar mais visível no Dark Mode.
                                      color: notifier.darkTheme
                                          ? MyColors.primary[300]
                                          : MyColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                    ),
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _body(),
          ],
        ),
      ),
    );
  }

//Área de funções
  void _showCheckboxFalseAlert() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.sizeFade,
      duration: const Duration(
        milliseconds: 200,
      ),
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
      },
    );
  }

//Funções a serem usadas no futuro
  // ignore: unused_element
  void _showInsufficientCredentialsAlert() {}

  // ignore: unused_element
  void _showInvalidCredentialsAlert() {}

  // ignore: unused_element
  void _showIncorrectPasswordAlert() {}
}
