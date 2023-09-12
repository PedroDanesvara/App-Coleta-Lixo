import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';
import 'package:app_coleta_lixo/pages/account_auth/final_signup_page.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/pages/user_pages/awards_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/history_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/payment_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/user_settings_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/privacy_policy_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/rating_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/register_address_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/personal_data_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/terms_of_use_page.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/state_controller.dart';
import 'pages/account_auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'pages/account_auth/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return AnimatedBuilder(
            animation: AppController.instance,
            builder: (context, child) {
              return MaterialApp(
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('pt', 'BR'),
                ],
                debugShowCheckedModeBanner: false,
                theme: notifier.darkTheme ? dark : light,
                initialRoute: '/login',
                routes: {
                  '/login': (context) => const LoginPage(),
                  '/navigator': (context) => const AppNavigator(),
                  '/signup': (context) => const SignUpPage(),
                  '/finalsignup': (context) => const FinalSignUpPage(),
                  '/ppp': (context) => const PrivacyPolicyPage(),
                  '/tou': (context) => const TermsOfUsePage(),
                  '/mappage': (context) => const RegisterAddressPage(),
                  '/createoffer': (context) => const CreateOfferPage(),
                  '/ratingpage': (context) => const RatingPage(),
                  '/awardspage': (context) => const AwardsPage(),
                  '/historypage': (context) => const HistoryPage(),
                  '/datapage': (context) => const UserSettingsPage(),
                  '/paymentpage': (context) => const PaymentPage(),
                  '/settingspage': (context) => const UserSettingsPage(),
                  '/personaldata': (context) => const PersonalDataPage(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
