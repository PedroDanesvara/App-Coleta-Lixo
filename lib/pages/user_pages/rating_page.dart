import 'package:app_coleta_lixo/models/colors.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  _body() {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  children: [],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliações'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          color: AppController.instance.isDarkTheme
              ? const Color(0xFFFFFFFF)
              : Color.fromARGB(0, 0, 0, 0).withOpacity(1),
        ),
        backgroundColor: AppController.instance.isDarkTheme
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
            color: AppController.instance.isDarkTheme
                ? Colors.grey
                : Colors.grey[800],
            size: 28,
          ),
        ),
        elevation: 2,
      ),
      body: Stack(children: [_body()]),
    );
  }
}
