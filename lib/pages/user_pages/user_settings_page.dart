import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import '../../providers/usuario_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:app_coleta_lixo/data_api/repositories/usuario_repository.dart';
import 'package:app_coleta_lixo/data_api/http/http_client.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  final UsuarioController usuarioController = UsuarioController(
      repository: UsuarioRepository(
    client: HttpClient(),
  ));

  _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return AnimatedBuilder(
          animation: AppController.instance,
          builder: (context, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior: ScrollRemove(),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              textAlign: TextAlign.start,
                              'Ajuda e Suporte',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: notifier.darkTheme
                                    ? MyColors.darkGrayScale[50]
                                    : MyColors.darkGrayScale[400],
                              ),
                            ),
                            onTap: () {},
                            leading: Icon(
                              Icons.support_agent,
                              size: 32,
                              color: MyColors.primary[400],
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: notifier.darkTheme
                                  ? Colors.grey[400]
                                  : MyColors.darkGrayScale[300],
                            ),
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                width: 2,
                                color: notifier.darkTheme
                                    ? Colors.grey.shade600
                                    : const Color.fromARGB(234, 202, 197, 197),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              textAlign: TextAlign.start,
                              'Sobre',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: notifier.darkTheme
                                    ? MyColors.darkGrayScale[50]
                                    : MyColors.darkGrayScale[400],
                              ),
                            ),
                            onTap: () {},
                            leading: Icon(
                              Icons.info,
                              size: 32,
                              color: MyColors.primary[400],
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: notifier.darkTheme
                                  ? Colors.grey[400]
                                  : MyColors.darkGrayScale[300],
                            ),
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                width: 2,
                                color: notifier.darkTheme
                                    ? Colors.grey.shade600
                                    : const Color.fromARGB(234, 202, 197, 197),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              textAlign: TextAlign.start,
                              'Termos de privacidade',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: notifier.darkTheme
                                    ? MyColors.darkGrayScale[50]
                                    : MyColors.darkGrayScale[400],
                              ),
                            ),
                            onTap: () {},
                            leading: Icon(
                              Icons.privacy_tip,
                              size: 32,
                              color: MyColors.primary[400],
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: notifier.darkTheme
                                  ? Colors.grey[400]
                                  : MyColors.darkGrayScale[300],
                            ),
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                width: 2,
                                color: notifier.darkTheme
                                    ? Colors.grey.shade600
                                    : const Color.fromARGB(234, 202, 197, 197),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              textAlign: TextAlign.start,
                              'Excluir conta',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: notifier.darkTheme
                                    ? MyColors.darkGrayScale[50]
                                    : MyColors.darkGrayScale[400],
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                isDismissible: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svg_icons/user_settings_page_icons/cry_emoji.svg',
                                          height: 60,
                                          width: 60,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              'Você está prestes a excluir a sua conta!',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              'Tem certeza disso?',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.red),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.cancel,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Não',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder: (context) {
                                                    return ClassicGeneralDialogWidget(
                                                      titleText:
                                                          'Excluir a conta',
                                                      contentText:
                                                          "Você tem certeza disso?",
                                                      positiveText: 'Confirmar',
                                                      positiveTextStyle:
                                                          TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto',
                                                        color: MyColors
                                                            .primary[500],
                                                      ),
                                                      onPositiveClick: () {
                                                        usuarioController
                                                            .deletarUsuario();
                                                        Navigator
                                                            .pushNamedAndRemoveUntil(
                                                                context,
                                                                '/login',
                                                                (route) =>
                                                                    false);
                                                      },
                                                      negativeText: 'Cancelar',
                                                      negativeTextStyle:
                                                          TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto',
                                                        color: MyColors
                                                            .primary[500],
                                                      ),
                                                      onNegativeClick: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Colors.green,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Sim',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            leading: Icon(
                              Icons.cancel,
                              size: 32,
                              color: MyColors.primary[400],
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              size: 36,
                              color: notifier.darkTheme
                                  ? Colors.grey[400]
                                  : MyColors.darkGrayScale[300],
                            ),
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                width: 2,
                                color: notifier.darkTheme
                                    ? Colors.grey.shade600
                                    : const Color.fromARGB(234, 202, 197, 197),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text(
                              textAlign: TextAlign.start,
                              'Sair',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: notifier.darkTheme
                                    ? MyColors.darkGrayScale[50]
                                    : MyColors.darkGrayScale[400],
                              ),
                            ),
                            onTap: () {
                              showAnimatedDialog(
                                context: context,
                                barrierDismissible: true,
                                animationType: DialogTransitionType.sizeFade,
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                builder: (context) =>
                                    ClassicGeneralDialogWidget(
                                  titleText: 'Sair da conta',
                                  contentText: 'Tem certeza que deseja sair?',
                                  negativeText: 'Fechar',
                                  negativeTextStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.primary[400],
                                  ),
                                  onNegativeClick: () {
                                    Navigator.pop(context);
                                  },
                                  positiveText: 'Confirmar',
                                  positiveTextStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.primary[400],
                                  ),
                                  onPositiveClick: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/login', (route) => false);
                                  },
                                ),
                              );
                              AppController.instance.isSignUpCheckboxConfirmed =
                                  false;
                              AppController.instance.occupationState = false;
                              AppController.instance.catadorState = false;
                              AppController.instance.coletorState = false;
                              AppController.instance.sucatariaState = false;
                            },
                            leading: const Icon(
                              Icons.logout,
                              size: 32,
                              color: Colors.red,
                            ),
                            dense: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                width: 2,
                                color: notifier.darkTheme
                                    ? Colors.grey.shade600
                                    : const Color.fromARGB(234, 202, 197, 197),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Configurações de usuário',
            ),
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: notifier.darkTheme
                  ? const Color(0xFFFFFFFF)
                  : const Color.fromARGB(0, 0, 0, 0).withOpacity(1),
            ),
            backgroundColor: notifier.darkTheme
                ? MyColors.grayScale[900]
                : Colors.white.withOpacity(1),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    child: const AppNavigator(),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back,
                color: notifier.darkTheme ? Colors.grey : Colors.grey[800],
                size: 28,
              ),
            ),
            actions: const [
              DarkButton(),
            ],
            elevation: 2,
          ),
          body: Stack(
            children: [
              _body(),
            ],
          ),
        );
      },
    );
  }
}
