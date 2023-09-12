import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});
  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _cpfTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _dateTextController = TextEditingController();

  String name = '';
  String email = '';
  String phoneNumber = '';
  String cpf = '';
  String password = '';
  String date = '';

  var nameMaskFormatter = MaskTextInputFormatter(
      mask:
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      filter: {
        "x": RegExp(
            r'[a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØŒŠÞÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøœšþúûüýÿ\s]'),
      },
      type: MaskAutoCompletionType.eager);
  var phoneNumberMaskFormatter = MaskTextInputFormatter(
      mask: '(xx) xxxxx-xxxx',
      filter: {
        "x": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy);
  var cpfMaskFormatter = MaskTextInputFormatter(
      mask: 'xxx.xxx.xxx-xx',
      filter: {
        "x": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy);
  var dateMaskFormatter = MaskTextInputFormatter(
      mask: 'xx/xx/xxxx',
      filter: {
        "x": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy);
  Widget _body() {
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
                          AutoSizeTextField(
                            
                            textAlign: TextAlign.center,
                            inputFormatters: [nameMaskFormatter],
                            controller: _nameTextController,
                            maxLength: 100,
                            onChanged: (text) {
                              name = text;
                            },
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              isDense: true,
                              counterText: '',
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Center(
                                widthFactor:
                                    MediaQuery.of(context).size.width / 2,
                                child: const Text(
                                  'Nome',
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeTextField(
                            textAlign: TextAlign.center,
                            controller: _emailTextController,
                            onChanged: (text) {
                              email = text;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.email,
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Center(
                                widthFactor:
                                    MediaQuery.of(context).size.width / 2,
                                child: const Text(
                                  'Email',
                                ),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            inputFormatters: [phoneNumberMaskFormatter],
                            controller: _phoneTextController,
                            onChanged: (text) {
                              phoneNumber = text;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.phone,
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Center(
                                widthFactor:
                                    MediaQuery.of(context).size.width / 2,
                                child: const Text(
                                  'Número de celular',
                                ),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            inputFormatters: [cpfMaskFormatter],
                            controller: _cpfTextController,
                            onChanged: (text) {
                              cpf = text;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.badge,
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Center(
                                widthFactor:
                                    MediaQuery.of(context).size.width / 2,
                                child: const Text(
                                  'CPF',
                                ),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
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
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.lock,
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Center(
                                widthFactor:
                                    MediaQuery.of(context).size.width / 2,
                                child: const Text(
                                  'Senha',
                                ),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            inputFormatters: [dateMaskFormatter],
                            controller: _dateTextController,
                            onChanged: (text) {
                              date = text;
                            },
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.calendar_month,
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
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              label: Center(
                                widthFactor:
                                    MediaQuery.of(context).size.width / 2,
                                child: const Text(
                                  'Data de nascimento',
                                ),
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
            title: const Text('Dados pessoais'),
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
