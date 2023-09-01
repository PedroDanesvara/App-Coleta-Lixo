import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/pages/user_pages/awards_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/history_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/payment_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/user_settings_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/rating_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/personal_data_page.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _biographyTextController = TextEditingController();

  String biography = '';
  int charactersLeft = 400;

  Future<bool> _onWillPop() async {
    return false;
  }

  Widget _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: AnimatedBuilder(
            animation: AppController.instance,
            builder: (context, child) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                    child: ListView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      children: [
                        AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: true,
                          backgroundColor: notifier.darkTheme
                              ? MyColors.darkGrayScale[500]
                              : const Color.fromARGB(255, 255, 255, 255),
                          centerTitle: true,
                          title: Text(
                            'Fl. 11, Q. 18, 14D',
                            style: TextStyle(
                              color: notifier.darkTheme
                                  ? MyColors.primary[300]
                                  : MyColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.red,
                                    Colors.purple,
                                    Colors.blue,
                                    Colors.green,
                                    Colors.amber,
                                    Colors.orange,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  3.0,
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: const AssetImage(
                                      'assets/images/pedro_avatar.jpg',
                                    ),
                                    child: badges.Badge(
                                      ignorePointer: false,
                                      showBadge: true,
                                      badgeContent: const Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                      ),
                                      badgeStyle: badges.BadgeStyle(
                                        badgeColor: Colors.white.withOpacity(0),
                                        padding: const EdgeInsets.all(57.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            'Pedro Henrique',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: notifier.darkTheme
                                        ? MyColors.primary[800]
                                        : MyColors.primary,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Catador',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            color: notifier.darkTheme
                                                ? Colors.grey[250]
                                                : Colors.white),
                                      ),
                                      Container(
                                        width: 5.0,
                                      ),
                                      const Icon(
                                        Icons.emoji_events,
                                        size: 22,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        Flex(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: notifier.darkTheme
                                        ? MyColors.darkGrayScale[500]
                                        : Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(color: MyColors.primary),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Biografia',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w900,
                                            color: MyColors.primary),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 2,
                                  left: 5,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        child: const RatingPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: notifier.darkTheme
                                          ? MyColors.darkGrayScale[500]
                                          : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Icon(Icons.star, color: Colors.yellow),
                                        SvgPicture.asset(
                                          'assets/images/svg_icons/star_icon.svg',
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            color: notifier.darkTheme
                                                ? Colors.grey[300]
                                                : Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2, right: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        child: const AwardsPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: notifier.darkTheme
                                          ? MyColors.darkGrayScale[500]
                                          : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svg_icons/medal_icon.svg',
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 7.0,
                                        ),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            color: notifier.darkTheme
                                                ? Colors.grey[300]
                                                : Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        child: const HistoryPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: notifier.darkTheme
                                          ? MyColors.darkGrayScale[500]
                                          : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svg_icons/recycle_bin_icon.svg',
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 7.0,
                                        ),
                                        Text(
                                          '50',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            color: notifier.darkTheme
                                                ? Colors.grey[300]
                                                : Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              child: AutoSizeTextField(
                                controller: _biographyTextController,
                                onChanged: (text) {
                                  biography = text;

                                  setState(
                                    () {
                                      charactersLeft = 400 - biography.length;
                                    },
                                  );
                                },
                                maxLines: null,
                                expands: true,
                                maxLength: 400,
                                keyboardType: TextInputType.multiline,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                  hintText: 'Informe sua biografia aqui.',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  counterStyle: charactersLeft <= 20
                                      ? const TextStyle(
                                          color: Colors.red,
                                        )
                                      : TextStyle(
                                          color: Colors.grey[700],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                            top: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                charactersLeft == 1
                                    ? 'Resta $charactersLeft caractere.'
                                    : 'Restam $charactersLeft caracteres.',
                                style: TextStyle(
                                  color: charactersLeft <= 20
                                      ? Colors.red
                                      : notifier.darkTheme
                                          ? Colors.grey[300]
                                          : Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.edit,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const HistoryPage(),
                                    ),
                                  );
                                },
                                leading: Icon(
                                  Icons.update,
                                  size: 32,
                                  color: MyColors.primary[400],
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  size: 36,
                                  color: notifier.darkTheme
                                      ? Colors.grey[400]
                                      : MyColors.darkGrayScale[300],
                                ),
                                title: Text(
                                  textAlign: TextAlign.center,
                                  'Histórico',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: notifier.darkTheme
                                        ? MyColors.darkGrayScale[50]
                                        : MyColors.darkGrayScale[400],
                                  ),
                                ),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    width: 2,
                                    color: notifier.darkTheme
                                        ? Colors.grey.shade600
                                        : Color.fromARGB(234, 202, 197, 197),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const PersonalDataPage(),
                                    ),
                                  );
                                },
                                leading: Icon(
                                  Icons.person,
                                  size: 32,
                                  color: MyColors.primary[400],
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  size: 36,
                                  color: notifier.darkTheme
                                      ? Colors.grey[400]
                                      : MyColors.darkGrayScale[300],
                                ),
                                title: Text(
                                  textAlign: TextAlign.center,
                                  'Dados pessoais',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: notifier.darkTheme
                                        ? MyColors.darkGrayScale[50]
                                        : MyColors.darkGrayScale[400],
                                  ),
                                ),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    width: 2,
                                    color: notifier.darkTheme
                                        ? Colors.grey.shade600
                                        : Color.fromARGB(234, 202, 197, 197),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const PaymentPage(),
                                    ),
                                  );
                                },
                                leading: Icon(
                                  Icons.credit_card,
                                  size: 32,
                                  color: MyColors.primary[400],
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  size: 36,
                                  color: notifier.darkTheme
                                      ? Colors.grey[400]
                                      : MyColors.darkGrayScale[300],
                                ),
                                title: Text(
                                  textAlign: TextAlign.center,
                                  'Pagamentos',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: notifier.darkTheme
                                        ? MyColors.darkGrayScale[50]
                                        : MyColors.darkGrayScale[400],
                                  ),
                                ),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    width: 2,
                                    color: notifier.darkTheme
                                        ? Colors.grey.shade600
                                        : const Color.fromARGB(
                                            234, 202, 197, 197),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: const UserSettingsPage(),
                                    ),
                                  );
                                },
                                leading: Icon(
                                  Icons.settings,
                                  size: 32,
                                  color: MyColors.primary[400],
                                ),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  size: 36,
                                  color: notifier.darkTheme
                                      ? Colors.grey[400]
                                      : MyColors.darkGrayScale[300],
                                ),
                                title: Text(
                                  textAlign: TextAlign.center,
                                  'Configurações de usuário',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: notifier.darkTheme
                                        ? MyColors.darkGrayScale[50]
                                        : MyColors.darkGrayScale[400],
                                  ),
                                ),
                                dense: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    width: 2,
                                    color: notifier.darkTheme
                                        ? Colors.grey.shade600
                                        : const Color.fromARGB(
                                            234, 202, 197, 197),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    return Scaffold(
      body: Stack(
        children: [
          _body(),
        ],
      ),
    );
  }
}
