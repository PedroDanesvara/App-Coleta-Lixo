import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'colors.dart';

//Widget do switch do Dark Mode
class DarkSwitch extends StatefulWidget {
  const DarkSwitch({super.key});

  @override
  State<DarkSwitch> createState() => DarkSwitchState();
}

class DarkSwitchState extends State<DarkSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      activeColor: MyColors.primary,
      onChanged: (value) {
        setState(() {
          AppController.instance.changeTheme();
        });
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
          setState(() {
            AppController.instance.checkboxSet();
          });
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
