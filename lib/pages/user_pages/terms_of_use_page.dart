import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});

  @override
  State<TermsOfUsePage> createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
  Widget _body() {
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
                children: const [
                  Column(
                    children: [],
                  ),
                ],
              ),
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
        title: const Text('Testando tou'),
      ),
      body: Stack(
        children: [
          _body(),
        ],
      ),
    );
  }
}
