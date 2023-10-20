import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  static String address = '',
      neighborhood = '',
      city = '',
      cep = '',
      nearbyLocation = '';

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Future<bool> _onWillPop() async {
    return false;
  }

  final _addressTextController = TextEditingController();
  final _neighborhoodTextController = TextEditingController();
  final _cityTextController = TextEditingController();
  final _cepTextController = TextEditingController();
  final _nearbyLocationTextController = TextEditingController();

  Widget _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: AnimatedBuilder(
            animation: AppController.instance,
            builder: (context, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SafeArea(
                  child: ScrollConfiguration(
                    behavior: ScrollRemove(),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        AppBar(
                          elevation: 0,
                          automaticallyImplyLeading: true,
                          backgroundColor: notifier.darkTheme
                              ? MyColors.darkGrayScale[500]
                              : const Color(0xFFFAFAFA),
                          centerTitle: true,
                          title: Text(
                            'Informações de localização',
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
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              // Campo de texto para o endereço
                              TextField(
                                controller: _addressTextController,
                                onChanged: (text) {
                                  LocationPage.address = text;
                                },
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Endereço',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Campo de texto para o bairro
                              TextField(
                                controller: _neighborhoodTextController,
                                onChanged: (text) {
                                  LocationPage.neighborhood = text;
                                },
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Bairro',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Campo de texto para a cidade
                              TextField(
                                controller: _cityTextController,
                                onChanged: (text) {
                                  LocationPage.city = text;
                                },
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Cidade',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Campo de texto para o CEP
                              TextField(
                                controller: _cepTextController,
                                onChanged: (text) {
                                  LocationPage.cep = text;
                                },
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'CEP',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Campo de texto para a localização próxima
                              TextField(
                                controller: _nearbyLocationTextController,
                                onChanged: (text) {
                                  LocationPage.nearbyLocation = text;
                                },
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: 'Localização Próxima',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Text(
                            'Procurar no mapa',
                            style: TextStyle(
                                color: notifier.darkTheme
                                    ? MyColors.grayScale[200]
                                    : MyColors.grayScale[500]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/location_photo.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Flexible(
                                // Botão "Salvar"
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    backgroundColor: notifier.darkTheme
                                        ? MyColors.grayScale[800]
                                        : MyColors.primary,
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  onPressed: () {
                                    // Adicione a ação de salvar aqui
                                  },
                                  child: Text(
                                    'Salvar',
                                    style: TextStyle(
                                      color: notifier.darkTheme
                                          ? MyColors.primary[50]
                                          : Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
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
      body: SafeArea(
        child: Stack(
          children: [
            _body(),
          ],
        ),
      ),
    );
  }
}
