import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';
import 'package:flutter/material.dart';

class SecondConfirmationPage extends StatefulWidget {
  const SecondConfirmationPage({super.key});

  @override
  State<SecondConfirmationPage> createState() => _SecondConfirmationPageState();
}

class _SecondConfirmationPageState extends State<SecondConfirmationPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        AppNavigator.selectedPage.value = 0;
        CreateOfferPage.trashType = '';
        CreateOfferPage.trashWeight = '';
        CreateOfferPage.trashValue = '';
        Navigator.pushNamedAndRemoveUntil(
            context, '/navigator', (route) => false);
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
            SizedBox(
              height: 240,
              child: OverflowBox(
                minHeight: 250,
                maxHeight: 250,
                child: Lottie.asset(
                  'assets/animated/thumbs_up.json',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
