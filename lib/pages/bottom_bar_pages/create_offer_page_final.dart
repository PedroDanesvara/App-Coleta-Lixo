// ignore_for_file: prefer_const_constructors
import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/repositories/oferta_repository.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/bottom_navigator_controller.dart';
import 'package:app_coleta_lixo/pages/bottom_bar_pages/create_offer_page.dart';
import 'package:app_coleta_lixo/providers/oferta_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CreateOfferPageFinal extends StatefulWidget {
  const CreateOfferPageFinal({super.key});

  @override
  State<CreateOfferPageFinal> createState() => _CreateOfferPageFinalState();
}

class _CreateOfferPageFinalState extends State<CreateOfferPageFinal> {
  _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return AnimatedBuilder(
          animation: AppController.instance,
          builder: (context, child) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior: ScrollRemove(),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 10,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
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
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  'assets/images/pedro_avatar.jpg',
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
                    const Center(
                      child: Text(
                        'Pedro Henrique',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Criando oferta',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: MyColors.primary[400],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Container(
                        width: MediaQuery.of(context).size.height,
                        height: MediaQuery.of(context).size.width / 1.5,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/trash_photo.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        '${CreateOfferPage.formattedDate} - ${CreateOfferPage.formattedTime}',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: MyColors.primary),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 160),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${CreateOfferPage.trashType}: ',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${CreateOfferPage.trashWeight}kg',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Valor: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'R\$${CreateOfferPage.trashValue}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                ),
                                Text(
                                  '1.4 Km',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Confirmar?',
                        style: TextStyle(
                          color: MyColors.primary,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            print('''Dados: ${CreateOfferPage.trashType},
                                            ${CreateOfferPage.trashValue},
                                            ${CreateOfferPage.trashWeight},
                                            ${CreateOfferPage.formattedDate},
                                            ${CreateOfferPage.formattedTime},
                                            Formatadim: ${CreateOfferPage.formattedDate} ${CreateOfferPage.formattedTime},
                                            ''');
                            setState(
                              () {
                                CreateOfferPage.trashTypeTextController.clear();
                                CreateOfferPage.trashWeightTextController
                                    .clear();
                                CreateOfferPage.trashValueTextController
                                    .clear();
                                Navigator.of(context).pop(
                                  ValueListenableBuilder(
                                    valueListenable: AppNavigator.selectedPage,
                                    builder: (context, value, child) {
                                      return const AppNavigator();
                                    },
                                  ),
                                );
                              },
                            ); 
                          },
                          child: Icon(
                            Icons.cancel,
                            color: Colors.red,
                            size: 80,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            print("Cliquei em confirmar");

                            OfertaController ofertaController = OfertaController(
                              repository: OfertaRepository(
                                client: HttpClient()
                              )
                            );

                            final formattedDateAndTime = "${CreateOfferPage.formattedDate} - ${CreateOfferPage.formattedTime}";

                            ofertaController.createOferta(
                              tipoMaterial: CreateOfferPage.trashType, 
                              peso: CreateOfferPage.trashWeight, 
                              valor: CreateOfferPage.trashValue,
                              agendamento: formattedDateAndTime).then((result) {

                                CreateOfferPage.trashTypeTextController.clear();
                                CreateOfferPage.trashWeightTextController.clear();
                                CreateOfferPage.trashValueTextController.clear();
                                Navigator.pushNamedAndRemoveUntil(
                                  context, '/confirmationpage', (route) => false);
                              });
                          },
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 80,
                          ),
                        ),
                      ],
                    )
                  ],
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
              'Criar Oferta',
            ),
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              color:
                  notifier.darkTheme ? MyColors.primary[300] : MyColors.primary,
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
