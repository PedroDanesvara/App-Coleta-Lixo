import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/state_controller.dart';
import '../services/colors.dart';

//Widget do switch do Dark Mode
class DarkSwitch extends StatefulWidget {
  const DarkSwitch({super.key});

  @override
  State<DarkSwitch> createState() => DarkSwitchState();
}

class DarkSwitchState extends State<DarkSwitch> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return Switch(
          value: notifier.darkTheme,
          activeColor: MyColors.primary,
          onChanged: (value) {
            setState(
              () {
                notifier.toggleTheme();
              },
            );
          },
        );
      },
    );
  }
}

//Widget da Ckeckbox da página de cadastro
class SignupCheckbox extends StatefulWidget {
  const SignupCheckbox({super.key});

  @override
  State<SignupCheckbox> createState() => _SignupCheckboxState();
}

class _SignupCheckboxState extends State<SignupCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Checkbox(
        value: AppController.instance.isSignUpCheckboxConfirmed,
        onChanged: (value) {
          setState(
            () {
              AppController.instance.checkboxSet();
            },
          );
        },
      ),
    );
  }
}

//Classe pra remover o indicador de scroll de algumas páginas
class ScrollRemove extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
