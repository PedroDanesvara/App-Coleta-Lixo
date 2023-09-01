import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AwardsPage extends StatefulWidget {
  const AwardsPage({super.key});

  @override
  State<AwardsPage> createState() => _AwardsPageState();
}

class _AwardsPageState extends State<AwardsPage> {
  _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return AnimatedBuilder(
          animation: AppController.instance,
          builder: (context, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(
                  30.0,
                ),
                child: ScrollConfiguration(
                  behavior: ScrollRemove(),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [],
                  ),
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
            title: const Text(
              'Prêmios',
            ),
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
            elevation: 2,
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
