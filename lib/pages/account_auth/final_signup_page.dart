import 'package:flutter/material.dart';

import 'app_controller.dart';

class FinalSignUpPage extends StatefulWidget {
  const FinalSignUpPage({super.key});

  @override
  State<FinalSignUpPage> createState() => _FinalSignUpPageState();
}

class _FinalSignUpPageState extends State<FinalSignUpPage> {
  Widget _body() {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(children: const [
                Column(
                  children: [],
                )
              ]),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Testando page'),
        ),
        body: Stack(
          children: [
            _body(),
          ],
        ));
  }
}
