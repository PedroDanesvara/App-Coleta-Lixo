import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', password = '';

  Future<bool> _onWillPop(BuildContext context) async {
    bool? willPop = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Sair do aplicativo',
          contentText: 'Tem certeza que deseja sair?',
          positiveText: 'Confirmar',
          positiveTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            color: MyColors.primary[400],
          ),
          onPositiveClick: () {
            Navigator.of(context).pop(true);
          },
          negativeText: 'Fechar',
          negativeTextStyle: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            color: MyColors.primary[400],
          ),
          onNegativeClick: () {
            Navigator.of(context).pop(false);
          },
        );
      },
    );
    return willPop ?? false;
  }

  Widget _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: AnimatedBuilder(
            animation: AppController.instance,
            builder: (context, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  //Padding da Página de login
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: SafeArea(
                    child: ScrollConfiguration(
                      behavior: ScrollRemove(),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Container(
                            height: 30,
                          ),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: SvgPicture.asset(
                              'assets/images/svg_icons/logo.svg',
                            ),
                          ),
                          Container(
                            height: 70,
                          ),
                          Column(
                            children: [
                              //Campo de texto para o email
                              TextField(
                                onChanged: (text) {
                                  email = text;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Usuário',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                              const SizedBox(height: 10),

                              //Campo de texto para a senha
                              TextField(
                                onChanged: (text) {
                                  password = text;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    //Botão pressionável de "Entrar"
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          minimumSize:
                                              const Size.fromHeight(50),
                                          shadowColor: Colors.transparent),
                                      //Navegação entre telas
                                      onPressed: () {
                                        if (password != '123' ||
                                            email != '123') {
                                          _showSignInAlert();
                                        } else {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/navigator',
                                                  (route) => false);
                                        }
                                      },
                                      child: const Text(
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Roboto'),
                                          'Entrar'),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 2,
                                        shadowColor: const Color.fromARGB(
                                            216, 255, 255, 255),
                                        backgroundColor: notifier.darkTheme
                                            ? MyColors.grayScale
                                            : Colors.white,
                                        minimumSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/signup');
                                      },
                                      child: Text(
                                        'Cadastrar',
                                        style: TextStyle(
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
                            ],
                          ),
                          Container(height: 30),
                          const Row(
                            children: [
                              Flexible(
                                child: Divider(color: Colors.black),
                              ),
                              Text(
                                'OU',
                                style: TextStyle(
                                  color: MyColors.grayScale,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              Flexible(
                                child: Divider(color: Colors.black),
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize: 50,
                                icon: SvgPicture.asset(
                                  'assets/images/svg_icons/google_logo.svg',
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                iconSize: 50,
                                icon: SvgPicture.asset(
                                  'assets/images/svg_icons/instagram_logo.svg',
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                iconSize: 50,
                                icon: SvgPicture.asset(
                                  'assets/images/svg_icons/facebook_logo.svg',
                                ),
                              ),
                            ],
                          )
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

//Construção de widget próprio muito útil para referenciar o corpo principal da página.
//Pode ser também utilizado para equipe adicionar um background na tela de login no futuro.
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

  void _showSignInAlert() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.sizeFade,
      duration: const Duration(
        milliseconds: 200,
      ),
      builder: (context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Senha ou email incorreto! \nVerifique suas credenciais',
          positiveText: 'Fechar',
          onPositiveClick: () {
            Navigator.pop(context);
          },
          positiveTextStyle: const TextStyle(
            color: MyColors.primary,
          ),
        );
      },
    );
  }
}
