import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';

import 'package:flutter/material.dart';

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
      const Duration(seconds: 5),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
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
