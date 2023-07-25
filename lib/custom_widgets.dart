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

//Widget da Checkbox da página de cadastro
// class SignupCheckbox extends StatefulWidget {
//   const SignupCheckbox({super.key});

//   @override
//   State<SignupCheckbox> createState() => _SignupCheckboxState();
// }

// class _SignupCheckboxState extends State<SignupCheckbox> {
//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       controlAffinity: ListTileControlAffinity.leading,
//       value: AppController.instance.isCheckboxConfirmed,
//       activeColor: primary,
//       onChanged: (value) {
//         setState(() {
//           AppController.instance.checkboxSet();
//         });
//       },
//       title: Text(
//         'Ao se cadastrar, você concorda com nossos Termos de Uso e Política de Privacidade',
//         style: TextStyle(
//             color: grayScale.shade800,
//             fontFamily: 'Roboto',
//             fontSize: 14,
//             fontWeight: FontWeight.w400),
//       ),
//     );
//   }
// }

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
        value: AppController.instance.isCheckboxConfirmed,
        onChanged: (value) {
          setState(() {
            AppController.instance.checkboxSet();
          });
        },
      ),
    );
  }
}
