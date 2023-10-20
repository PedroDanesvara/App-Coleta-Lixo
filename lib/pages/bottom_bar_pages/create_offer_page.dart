import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreateOfferPage extends StatefulWidget {
  const CreateOfferPage({super.key});

  static String trashType = '', trashWeight = '', trashValue = '';

//Nao sei pq coloquei esses controladores aqui
  static final trashTypeTextController = TextEditingController(),
      trashWeightTextController = TextEditingController(),
      trashValueTextController = TextEditingController();

  static var parsedTrashWeight =
      double.tryParse(CreateOfferPage.trashWeight) ?? 0;
  static var parsedTrashValue =
      double.tryParse(CreateOfferPage.trashValue) ?? 0;
  static late DateTime dateTime;
  static DateTime initialDate = DateTime.now().toLocal();

  static var dateFormat = DateFormat('dd/M/yyyy', 'pt_BR');
  static var formattedDate = dateFormat.format(CreateOfferPage.dateTime);

  static var timeFormat = DateFormat('HH:mm');
  static var formattedTime = timeFormat.format(CreateOfferPage.dateTime);

  @override
  State<CreateOfferPage> createState() => _CreateOfferPageState();
}

class _CreateOfferPageState extends State<CreateOfferPage> {
  Future<bool> _onWillPop() async {
    return false;
  }

  bool _isButtonEnabled = false;
  var trashTypeMaskFormatter = MaskTextInputFormatter(
      mask:
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      filter: {
        "x": RegExp(
            r'[a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØŒŠÞÚÛÜÝßàáâãäåæçèéêëìíîïðñòóôõöøœšþúûüýÿ\s]'),
      },
      type: MaskAutoCompletionType.eager);

  @override
  void initState() {
    CreateOfferPage.dateTime = DateTime.now().toLocal();
    CreateOfferPage.initialDate = DateTime.now().toLocal();

    super.initState();
  }

  Widget _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: AnimatedBuilder(
            animation: AppController.instance,
            builder: (context, child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  child: ScrollConfiguration(
                    behavior: ScrollRemove(),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: true,
                          backgroundColor: notifier.darkTheme
                              ? MyColors.darkGrayScale[500]
                              : const Color(0xFFFAFAFA),
                          centerTitle: true,
                          title: Text(
                            'Criar oferta',
                            style: TextStyle(
                              color: notifier.darkTheme
                                  ? MyColors.primary[300]
                                  : MyColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: SvgPicture.asset(
                            'assets/images/svg_icons/logo.svg',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Text(
                                  'Cadastre o tipo, peso e valor do lixo',
                                  style: TextStyle(
                                    color: notifier.darkTheme
                                        ? MyColors.primary[300]
                                        : MyColors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                inputFormatters: [trashTypeMaskFormatter],
                                controller:
                                    CreateOfferPage.trashTypeTextController,
                                onChanged: (text) {
                                  CreateOfferPage.trashType = text;
                                  setState(() {
                                    _isButtonEnabled = text.isNotEmpty;
                                  });
                                },
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  labelText: 'Tipo de lixo',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                inputFormatters: [
                                  TextInputMask(
                                    mask: [
                                      '9.99',
                                      '99.99',
                                      '999.99',
                                      '9999.99',
                                      '99999.99'
                                    ],
                                  ),
                                ],
                                controller:
                                    CreateOfferPage.trashWeightTextController,
                                onChanged: (text) {
                                  CreateOfferPage.trashWeight = text;
                                  setState(() {
                                    _isButtonEnabled = text.isNotEmpty;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Peso do lixo (kg)',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                inputFormatters: [
                                  TextInputMask(
                                    mask: [
                                      '9.99',
                                      '99.99',
                                      '999.99',
                                      '9999.99',
                                      '99999.99',
                                      '999999.99'
                                    ],
                                  ),
                                ],
                                controller:
                                    CreateOfferPage.trashValueTextController,
                                onChanged: (text) {
                                  CreateOfferPage.trashValue = text;
                                  setState(() {
                                    _isButtonEnabled = text.isNotEmpty;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Valor (R\$)',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                child: Text(
                                  'Agende o horário para coleta',
                                  style: TextStyle(
                                    color: notifier.darkTheme
                                        ? MyColors.primary[300]
                                        : MyColors.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AnimatedButton(
                                isSelected: CreateOfferPage
                                        .trashType.isNotEmpty &&
                                    CreateOfferPage.trashWeight.isNotEmpty &&
                                    CreateOfferPage.trashValue.isNotEmpty,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                isReverse: false,
                                selectedBackgroundColor:
                                    const Color(0xFF439472),
                                backgroundColor: const Color(0xFF1F1F1F),
                                transitionType:
                                    TransitionType.RIGHT_CENTER_ROUNDER,
                                selectedTextColor: CreateOfferPage
                                            .trashType.isNotEmpty &&
                                        CreateOfferPage
                                            .trashWeight.isNotEmpty &&
                                        CreateOfferPage.trashValue.isNotEmpty
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color(0xFF959595),
                                onPress: () {
                                  setState(
                                    () {
                                      CreateOfferPage.parsedTrashValue =
                                          double.tryParse(
                                                  CreateOfferPage.trashValue) ??
                                              0;
                                      CreateOfferPage
                                          .parsedTrashWeight = double.tryParse(
                                              CreateOfferPage.trashWeight) ??
                                          0;
                                    },
                                  );

                                  if (CreateOfferPage.parsedTrashValue > 100) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return ClassicGeneralDialogWidget(
                                          contentText:
                                              'Preço não pode ser maior que R\$100.00!',
                                          positiveText: 'Confirmar',
                                          positiveTextStyle: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Roboto',
                                            color: MyColors.primary[500],
                                          ),
                                          onPositiveClick: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  } else if (CreateOfferPage.parsedTrashValue ==
                                          0 ||
                                      CreateOfferPage.parsedTrashWeight == 0 ||
                                      CreateOfferPage.trashType.isEmpty) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return ClassicGeneralDialogWidget(
                                          contentText:
                                              'Não deixe nenhum campo vazio!',
                                          positiveText: 'Confirmar',
                                          positiveTextStyle: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Roboto',
                                            color: MyColors.primary[500],
                                          ),
                                          onPositiveClick: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  } else if (CreateOfferPage.parsedTrashWeight >
                                      50) {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return ClassicGeneralDialogWidget(
                                          contentText:
                                              'Peso não pode ser maior que 50kg!',
                                          positiveText: 'Confirmar',
                                          positiveTextStyle: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Roboto',
                                            color: MyColors.primary[500],
                                          ),
                                          onPositiveClick: () {
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  } else if (CreateOfferPage
                                          .trashType.isEmpty &&
                                      CreateOfferPage.trashWeight.isEmpty &&
                                      CreateOfferPage.trashValue.isEmpty) {
                                    _isButtonEnabled = false;
                                  } else {
                                    showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          color: notifier.darkTheme
                                              ? MyColors.darkGrayScale
                                              : MyColors.primary[700],
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pushNamed(context,
                                                      '/finalofferpage');
                                                  CreateOfferPage
                                                          .formattedDate =
                                                      CreateOfferPage.dateFormat
                                                          .format(
                                                              CreateOfferPage
                                                                  .dateTime);

                                                  CreateOfferPage
                                                          .formattedTime =
                                                      CreateOfferPage.timeFormat
                                                          .format(
                                                              CreateOfferPage
                                                                  .dateTime);
                                                },
                                                child: Text(
                                                  'Confirmar',
                                                  style: TextStyle(
                                                      color: notifier.darkTheme
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                              Expanded(
                                                child: CupertinoTheme(
                                                  data: CupertinoThemeData(
                                                      brightness: notifier
                                                              .darkTheme
                                                          ? Brightness.dark
                                                          : Brightness.light),
                                                  child: CupertinoDatePicker(
                                                    minimumDate: CreateOfferPage
                                                        .initialDate,
                                                    initialDateTime:
                                                        CreateOfferPage
                                                            .initialDate,
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .dateAndTime,
                                                    use24hFormat: true,
                                                    onDateTimeChanged: (date) {
                                                      setState(
                                                        () {
                                                          CreateOfferPage
                                                              .dateTime = date;
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                                text: 'Agendar horário',
                                animatedOn: AnimatedOn.onHover,
                                textStyle: TextStyle(
                                  color: AppController.instance.occupationState
                                      ? Colors.white
                                      : MyColors.darkGrayScale[200],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
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
