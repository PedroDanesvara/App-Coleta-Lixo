import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final ScrollController _scrollController = ScrollController();

  List allItems = [
    'destaque',
    'dica',
    'avaliacao',
    'lixo_entregue',
    'lixo_coletado',
    'pagamento_realizado',
    'interesse',
    'catador',
  ];
  List selectedItems = [];

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  Widget _body() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                    parent: FixedExtentScrollPhysics()),
                children: [
                  AppBar(
                    elevation: 0.5,
                    automaticallyImplyLeading: true,
                    backgroundColor: AppController.instance.isDarkTheme
                        ? MyColors.darkGrayScale[500]
                        : const Color(0xFFFAFAFA),
                    centerTitle: true,
                    title: Text(
                      'Notificações',
                      style: TextStyle(
                          color: AppController.instance.isDarkTheme
                              ? MyColors.primary[300]
                              : MyColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto'),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        selectedItems.isNotEmpty ? selectedItems.length : 0,
                    // ignore: body_might_complete_normally_nullable
                    itemBuilder: ((BuildContext context, index) {
                      final itemName = selectedItems[index];
                      if (itemName == 'destaque') {
                        return Card(
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
                        );
                      } else if (itemName == 'dica') {
                        return Card(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        ));
                      } else if (itemName == 'avaliacao') {
                        return Card(
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
                        );
                      } else if (itemName == 'lixo_entregue') {
                        return Card(
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
                        );
                      } else if (itemName == 'lixo_coletado') {
                        return Card(
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
                        );
                      } else if (itemName == 'pagamento_realizado') {
                        return Card(
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
                        );
                      } else if (itemName == 'interesse') {
                        return Card(
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
                        );
                      } else if (itemName == 'catador') {
                        return Card(
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
                        );
                      }
                    }),
                  ),
                  Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          FloatingActionButton(
                            backgroundColor: AppController.instance.isDarkTheme
                                ? Colors.grey.shade700
                                : MyColors.primary,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      items: allItems,
                                      selectedItems: selectedItems,
                                      onSelectedItemsListChanged: (items) {
                                        selectedItems = items;
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
                                            selectedItems.contains('catador') ||
                                            selectedItems.isEmpty) {
                                          setState(() {});
                                        }
                                      },
                                    );
                                  });
                            },
                            child: const Icon(Icons.menu_open),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
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
        });
  }
}

class AlertDialog extends StatefulWidget {
  const AlertDialog({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onSelectedItemsListChanged,
  });

  final List items;
  final List selectedItems;
  final ValueChanged<List> onSelectedItemsListChanged;

  @override
  State<AlertDialog> createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialog> {
  List _tempSelectedItems = [];
  List _tempEmptyItems = [];

  @override
  void initState() {
    _tempSelectedItems = List.of(widget.selectedItems);
    _tempEmptyItems = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Notificações',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                final itemName = widget.items[index];
                return CheckboxListTile(
                  title: Text(itemName),
                  value: _tempSelectedItems.contains(itemName),
                  onChanged: (bool? value) {
                    if (value != null && value) {
                      if (!_tempSelectedItems.contains(itemName)) {
                        setState(
                          () {
                            _tempSelectedItems.add(itemName);
                          },
                        );
                      }
                    } else if (_tempSelectedItems.contains(itemName)) {
                      setState(
                        () {
                          _tempSelectedItems
                              .removeWhere((dynamic item) => item == itemName);
                        },
                      );
                    }
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.onSelectedItemsListChanged(_tempSelectedItems);
                    Navigator.pop(context);
                  },
                  child: const Text('Confirmar')),
              ElevatedButton(
                  onPressed: () {
                    widget.onSelectedItemsListChanged(_tempEmptyItems);
                    Navigator.pop(context);
                  },
                  child: const Text('Limpar'))
            ],
          )
        ],
      ),
    );
  }
}
