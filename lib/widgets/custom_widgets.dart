import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/state_controller.dart';

//Widget do switch do Dark Mode
class DarkButton extends StatefulWidget {
  const DarkButton({super.key});

  @override
  State<DarkButton> createState() => DarkButtonState();
}

class DarkButtonState extends State<DarkButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return IconButton(
          onPressed: () {
            notifier.toggleTheme();
          },
          icon: notifier.darkTheme
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
          color: notifier.darkTheme
              ? const Color.fromARGB(255, 251, 247, 247)
              : const Color.fromARGB(255, 0, 0, 0),
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

class NotificationItems {
  String notification;

  NotificationItems({required this.notification});
}

class NotificationRepository {
  final List<NotificationItems> allItems = [
    NotificationItems(notification: 'destaque'),
    NotificationItems(notification: 'dica'),
    NotificationItems(notification: 'avaliacao'),
    NotificationItems(notification: 'lixo_entregue'),
    NotificationItems(notification: 'lixo_coletado'),
    NotificationItems(notification: 'pagamento_realizado'),
    NotificationItems(notification: 'interesse'),
    NotificationItems(notification: 'catador'),
  ];
  List selectedItems = [];
  List tempSelectedItems = [];
}
