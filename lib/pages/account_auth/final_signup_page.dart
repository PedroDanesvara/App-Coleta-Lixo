import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/state_controller.dart';

class FinalSignUpPage extends StatefulWidget {
  const FinalSignUpPage({super.key});

  @override
  State<FinalSignUpPage> createState() => _FinalSignUpPageState();
}

class _FinalSignUpPageState extends State<FinalSignUpPage> {
  Future<bool> _onWillPop() async {
    AppController.instance.catadorState = false;
    AppController.instance.coletorState = false;
    AppController.instance.sucatariaState = false;
    AppController.instance.occupationState = false;
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
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
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
                              height: 70,
                            ),
                            const Column(
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: SizedBox(
                                      child: Text(
                                        'Selecione como você quer trabalhar ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: SizedBox(
                                      child: Text(
                                        'na nossa plataforma:',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: AnimatedButton(
                                    borderColor:
                                        AppController.instance.catadorState
                                            ? const Color(0xFF439472)
                                            : const Color(0xFF959595),
                                    isSelected:
                                        AppController.instance.catadorState,
                                    animationDuration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    isReverse: false,
                                    selectedBackgroundColor:
                                        const Color(0xFF439472),
                                    backgroundColor: notifier.darkTheme
                                        ? MyColors.grayScale
                                        : Colors.white,
                                    transitionType:
                                        TransitionType.LEFT_TO_RIGHT,
                                    selectedTextColor:
                                        AppController.instance.catadorState
                                            ? Colors.white
                                            : MyColors.primary,
                                    text: 'Catador',
                                    textStyle: TextStyle(
                                        color: notifier.darkTheme
                                            ? MyColors.primary[300]
                                            : MyColors.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Roboto'),
                                    onPress: () {
                                      AppController.instance.catadorSet();
                                      _isOccupationSelected();
                                    },
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
                                  child: AnimatedButton(
                                    borderColor:
                                        AppController.instance.coletorState
                                            ? const Color(0xFF439472)
                                            : const Color(0xFF959595),
                                    isSelected:
                                        AppController.instance.coletorState,
                                    animationDuration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    isReverse: false,
                                    selectedBackgroundColor:
                                        const Color(0xFF439472),
                                    backgroundColor: notifier.darkTheme
                                        ? MyColors.grayScale
                                        : Colors.white,
                                    transitionType:
                                        TransitionType.LEFT_TO_RIGHT,
                                    selectedTextColor:
                                        AppController.instance.coletorState
                                            ? Colors.white
                                            : MyColors.primary,
                                    text: 'Coletor',
                                    textStyle: TextStyle(
                                        color: notifier.darkTheme
                                            ? MyColors.primary[300]
                                            : MyColors.primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Roboto'),
                                    onPress: () {
                                      AppController.instance.coletorSet();
                                      _isOccupationSelected();
                                    },
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
                                  child: AnimatedButton(
                                    borderColor:
                                        AppController.instance.sucatariaState
                                            ? const Color(0xFF439472)
                                            : const Color(0xFF959595),
                                    isSelected:
                                        AppController.instance.sucatariaState,
                                    animationDuration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    isReverse: false,
                                    selectedBackgroundColor:
                                        const Color(0xFF439472),
                                    backgroundColor: notifier.darkTheme
                                        ? MyColors.grayScale
                                        : Colors.white,
                                    transitionType:
                                        TransitionType.LEFT_TO_RIGHT,
                                    selectedTextColor:
                                        AppController.instance.sucatariaState
                                            ? Colors.white
                                            : MyColors.primary,
                                    text: 'Sucataria',
                                    textStyle: TextStyle(
                                      color: notifier.darkTheme
                                          ? MyColors.primary[300]
                                          : MyColors.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                    ),
                                    onPress: () {
                                      AppController.instance.sucatariaSet();
                                      _isOccupationSelected();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 70,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: AnimatedButton(
                                    isSelected:
                                        AppController.instance.occupationState,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    isReverse: false,
                                    selectedBackgroundColor:
                                        const Color(0xFF439472),
                                    backgroundColor: const Color(0xFF1F1F1F),
                                    transitionType:
                                        TransitionType.RIGHT_CENTER_ROUNDER,
                                    selectedTextColor:
                                        AppController.instance.occupationState
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : const Color(0xFF959595),
                                    onPress: () {
                                      AppController.instance.occupationState
                                          ? Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/navigator',
                                                  (route) => false)
                                          : _showCheckboxNotCompletedAlert();
                                    },
                                    text: 'Concluir',
                                    animatedOn: AnimatedOn.onHover,
                                    textStyle: TextStyle(
                                      color:
                                          AppController.instance.occupationState
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
                                          .instance.occupationState) {
                                        AppController.instance.occupationState =
                                            false;
                                        AppController.instance.catadorState =
                                            false;
                                        AppController.instance.coletorState =
                                            false;
                                        AppController.instance.sucatariaState =
                                            false;
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
                            )
                          ],
                        ),
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
      body: Stack(
        children: [
          _body(),
        ],
      ),
    );
  }

//Área de funções

  void _isOccupationSelected() {
    if (AppController.instance.catadorState ||
        AppController.instance.coletorState ||
        AppController.instance.sucatariaState) {
      AppController.instance.occupationState = true;
    } else {
      AppController.instance.occupationState = false;
    }
  }

  void _showCheckboxNotCompletedAlert() {
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
          contentText: 'Coloque pelo menos uma ocupação!',
          positiveText: 'Fechar',
          onPositiveClick: () {
            Navigator.pop(context);
          },
          positiveTextStyle: const TextStyle(color: MyColors.primary),
        );
      },
    );
  }
}
