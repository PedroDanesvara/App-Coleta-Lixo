import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _cpfTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String name = '';
  String email = '';
  String phoneNumber = '';
  String cpf = '';
  String password = '';
  DateTime date = DateTime.now();

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
                child: ListView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
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
                          TextField(
                            textAlign: TextAlign.center,
                            controller: _nameTextController,
                            onChanged: (text) {
                              name = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 24,
                                color: MyColors.primary[400],
                              ),
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 24,
                                color: notifier.darkTheme
                                    ? Colors.grey[400]
                                    : MyColors.darkGrayScale[300],
                              ),
                              hintText: 'Nome',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            controller: _emailTextController,
                            onChanged: (text) {
                              email = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 24,
                                color: MyColors.primary[400],
                              ),
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 24,
                                color: notifier.darkTheme
                                    ? Colors.grey[400]
                                    : MyColors.darkGrayScale[300],
                              ),
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            controller: _phoneTextController,
                            onChanged: (text) {
                              phoneNumber = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 24,
                                color: MyColors.primary[400],
                              ),
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 24,
                                color: notifier.darkTheme
                                    ? Colors.grey[400]
                                    : MyColors.darkGrayScale[300],
                              ),
                              hintText: 'Número de celular',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            controller: _cpfTextController,
                            onChanged: (text) {
                              cpf = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 24,
                                color: MyColors.primary[400],
                              ),
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 24,
                                color: notifier.darkTheme
                                    ? Colors.grey[400]
                                    : MyColors.darkGrayScale[300],
                              ),
                              hintText: 'CPF',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            controller: _passwordTextController,
                            onChanged: (text) {
                              password = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 24,
                                color: MyColors.primary[400],
                              ),
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 24,
                                color: notifier.darkTheme
                                    ? Colors.grey[400]
                                    : MyColors.darkGrayScale[300],
                              ),
                              hintText: 'Senha',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(date.year + 1),
                              );
                              if (newDate == null) return;
                              setState(
                                () {
                                  date = newDate;
                                },
                              );
                            },
                            leading: Icon(
                              Icons.settings,
                              size: 24,
                              color: MyColors.primary[400],
                            ),
                            trailing: Icon(
                              Icons.edit,
                              size: 24,
                              color: notifier.darkTheme
                                  ? Colors.grey[400]
                                  : MyColors.darkGrayScale[300],
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                textAlign: TextAlign.center,
                                '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: notifier.darkTheme
                                      ? MyColors.grayScale[200]
                                      : MyColors.darkGrayScale[300],
                                ),
                              ),
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
                            height: 5,
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
            title: const Text('Configurações'),
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
            elevation: 1,
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
