import 'package:app_coleta_lixo/pages/bottom_bar_pages/notifications_page.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationDialog extends StatefulWidget {
  const NotificationDialog({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onSelectedItemsListChanged,
  });

  final List items, selectedItems;
  final ValueChanged<List> onSelectedItemsListChanged;


  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  List _tempSelectedItems = [];
  // ignore: unused_field
  List _tempEmptyItems = [];

  @override
  void initState() {
    _tempSelectedItems = List.of(widget.selectedItems);
    _tempEmptyItems = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return Dialog(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Text(
                      'Notificações',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final itemName = widget.items[index];
                    return SizedBox(
                      height: 70,
                      child: ListTile(
                        title: Text(itemName),
                        trailing: SizedBox(
                          height: 35,
                          width: 35,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(
                                () {
                                 

                                 
                                  print(NotificationRepository().selectedItems);

                                  _tempSelectedItems.add(itemName);
                                  widget.onSelectedItemsListChanged(
                                      _tempSelectedItems);

                                  NotificationsPage
                                      .notificationItemCount.value++;
                                },
                              );
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Fechar',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
