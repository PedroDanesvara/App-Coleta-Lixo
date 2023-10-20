import 'dart:async';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        AppNavigator.selectedPage.value = 0;
        CreateOfferPage.trashType = '';
        CreateOfferPage.trashWeight = '';
        CreateOfferPage.trashValue = '';
        Navigator.pushNamedAndRemoveUntil(
            context, '/secondconfirmation', (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Container(
              child: Lottie.asset(
                'assets/animated/recycling.json',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
