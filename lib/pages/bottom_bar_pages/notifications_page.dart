import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_coleta_lixo/widgets/notification_alert_dialog.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();

  static final ValueNotifier<int> notificationItemCount = ValueNotifier(0);
}

class _NotificationsPageState extends State<NotificationsPage> {
  List selectedItems = [];

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
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ScrollConfiguration(
                  behavior: ScrollRemove(),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      AppBar(
                        elevation: 0.5,
                        automaticallyImplyLeading: true,
                        backgroundColor: notifier.darkTheme
                            ? MyColors.darkGrayScale[500]
                            : const Color(0xFFFAFAFA),
                        centerTitle: true,
                        title: Text(
                          'Notificações',
                          style: TextStyle(
                            color: notifier.darkTheme
                                ? MyColors.primary[300]
                                : MyColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable:
                            NotificationsPage.notificationItemCount,
                        builder: (context, value, child) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: selectedItems.isNotEmpty
                                ? selectedItems.length
                                : 0,
                            // ignore: body_might_complete_normally_nullable
                            itemBuilder: ((BuildContext context, index) {
                              final itemName = selectedItems[index];
                              if (itemName == 'destaque') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/medal_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 36,
                                          ),
                                          Text(
                                            '5m',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Parabéns, você acabou de ganhar uma medalha por ser o catador de destaque da semana!',
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'dica') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/lightbulb_icon.svg',
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dica do dia!',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(
                                                92,
                                                194,
                                                152,
                                                1,
                                              ),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                              'Tire as tampinhas das garrafas PET e Tetrapak...')
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'avaliacao') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/star_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 32,
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Alguém acabou de avaliar o seu perfil!',
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'lixo_entregue') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/trash_person_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 32,
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Lixo entregue!!!',
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'lixo_coletado') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/trash_bag_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 32,
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Lixo coletado!!!',
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'pagamento_realizado') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/coin_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 32,
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Pagamento realizado!',
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'interesse') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/product_interest_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 32,
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Alguém se interessou pelo seu produto.',
                                      ),
                                    ),
                                  ),
                                );
                              } else if (itemName == 'catador') {
                                return Dismissible(
                                  direction: DismissDirection.startToEnd,
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(
                                      () {
                                        selectedItems.removeAt(index);
                                        NotificationsPage
                                            .notificationItemCount.value--;
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        alignment: const Alignment(4, 0.6),
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {},
                                      ),
                                      leading: Column(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/svg_icons/need_collector_icon.svg',
                                            fit: BoxFit.contain,
                                            height: 32,
                                          ),
                                          Text(
                                            '1h',
                                          ),
                                        ],
                                      ),
                                      title: const Text(
                                        'Precisamos de um catador. Você está disponível?',
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }),
                          );
                        },
                      ),
                      Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              FloatingActionButton(
                                backgroundColor: notifier.darkTheme
                                    ? Colors.grey.shade700
                                    : MyColors.primary,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return NotificationDialog(
                                        items: NotificationRepository()
                                            .allItems
                                            .map((item) => item.notification)
                                            .toList(),
                                        selectedItems: NotificationRepository()
                                            .selectedItems,
                                        onSelectedItemsListChanged: (items) {
                                          selectedItems = items;
                                          NotificationRepository()
                                              .selectedItems = items;
                                              
                                          if (selectedItems
                                                  .contains('destaque') ||
                                              selectedItems.contains('dica') ||
                                              selectedItems
                                                  .contains('avaliacao') ||
                                              selectedItems
                                                  .contains('lixo_entregue') ||
                                              selectedItems
                                                  .contains('lixo_coletado') ||
                                              selectedItems.contains(
                                                  'pagamento_realizado') ||
                                              selectedItems
                                                  .contains('interesse') ||
                                              selectedItems
                                                  .contains('catador') ||
                                              selectedItems.isEmpty) {
                                            setState(
                                              () {},
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                },
                                child: const Icon(Icons.menu_open),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
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
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return Scaffold(
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
