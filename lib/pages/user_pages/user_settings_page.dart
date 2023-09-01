import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  final String name = '';
  final String email = '';
  final String phone = '';
  final String cpf = '';
  final String password = '';
  final String birthdayDate = '';

  _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return AnimatedBuilder(
          animation: AppController.instance,
          builder: (context, child) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: [],
                  ),
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