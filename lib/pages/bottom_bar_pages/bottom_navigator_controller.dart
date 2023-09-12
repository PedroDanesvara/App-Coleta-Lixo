import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/home_page.dart';
import 'package:app_coleta_lixo/pages/user_pages/register_address_page.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/notifications_page.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/profile_page.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int notificationAdd = 0;
  int selectedPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const RegisterAddressPage(),
    const CreateOfferPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return AnimatedBuilder(
          animation: AppController.instance,
          builder: (context, child) {
            return ValueListenableBuilder(
              valueListenable: HomePage.notificationNumber,
              builder: (context, value, child) {
                return ValueListenableBuilder(
                  valueListenable: NotificationsPage.notificationItemCount,
                  builder: (context, value, child) {
                    return Scaffold(
                      body: pages.elementAt(selectedPage),
                      bottomNavigationBar: NavigationBar(
                        indicatorColor: MyColors.primary[700],
                        animationDuration: const Duration(
                          milliseconds: 1000,
                        ),
                        backgroundColor: notifier.darkTheme
                            ? MyColors.primary[900]
                            : MyColors.primary,
                        height: 50,
                        destinations: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            child: NavigationDestination(
                              icon: Icon(
                                Icons.home,
                                size: 30,
                                color: Colors.white,
                              ),
                              label: '',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            child: NavigationDestination(
                              icon: Icon(
                                Icons.gps_fixed,
                                size: 30,
                                color: Colors.white,
                              ),
                              label: '',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            child: NavigationDestination(
                              icon: Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                              label: '',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: NavigationDestination(
                              icon: Badge(
                                label: Text(
                                  NotificationsPage.notificationItemCount.value
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                isLabelVisible: NotificationsPage
                                            .notificationItemCount.value >
                                        0
                                    ? true
                                    : false,
                                child: const Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              label: '',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            child: NavigationDestination(
                              icon: Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.white,
                              ),
                              label: '',
                            ),
                          ),
                        ],
                        selectedIndex: selectedPage,
                        onDestinationSelected: (int value) {
                          setState(
                            () {
                              selectedPage = value;
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
