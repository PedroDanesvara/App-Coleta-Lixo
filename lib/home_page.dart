import 'package:app_coleta_lixo/app_controller.dart';

import 'custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(Object context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: Lottie.asset(
                  'assets/animated/under_construction.json',
                  height: 200,
                  width: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Página em desenvolvimento e apenas para fins de navegação onde a página de login tem que ir!!! \nO switch, no meio da tela, serve para controlar o Dark Mode do programa.\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 10,
              ),
              const DarkSwitch(),
              Container(
                height: 50,
              ),
            ]),
          ),
        );
      },
    );
  }
}
