import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/repositories/oferta_repository.dart';
import 'package:app_coleta_lixo/providers/oferta_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/services/colors.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:app_coleta_lixo/widgets/theme_save.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }

  static final ValueNotifier<int> notificationNumber = ValueNotifier(0);
}

class HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  //Oferta controller init
  final OfertaController ofertaController = OfertaController(
    repository: OfertaRepository(
      client: HttpClient(),
      )
    );
  
  @override
  void initState() {
    super.initState();
    print("initState da tela Home");
    ofertaController.getOfertas();
  }
  //Oferta controller end

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  Widget _body() {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: AnimatedBuilder(
            animation: Listenable.merge([
              AppController.instance,
              ofertaController.isLoading,
              ofertaController.erro,
              ofertaController.ofertas,
              ]),
            builder: (context, child) {

              dynamic MyHomeView;
              dynamic MyCustomWidget;

              //Tela carregando as ofertas da API
              if(ofertaController.isLoading.value){
                return const Center(child: CircularProgressIndicator());
              }

              //Se não tiver vazio, significa que tem erro
              if(ofertaController.erro.value.isNotEmpty) {
                MyHomeView = Center(
                  child: Text(
                    ofertaController.erro.value,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              //Não há ofertas pra listar
              else if (ofertaController.ofertas.value.isEmpty) {

                MyHomeView = ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        AppBar(
                          elevation: 0.5,
                          automaticallyImplyLeading: false,
                          backgroundColor: notifier.darkTheme
                              ? MyColors.darkGrayScale[500]
                              : const Color(0xFFFAFAFA),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/svg_icons/logo.svg',
                                fit: BoxFit.contain,
                                height: 28,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  'App Coleta',
                                  style: TextStyle(
                                      color: notifier.darkTheme
                                          ? MyColors.primary[300]
                                          : MyColors.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/pedro_avatar.jpg'),
                          ),
                          title: const Text(
                            'Pedro Henrique',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                          subtitle: const Text(
                            'Fl 11, Q. 18, 14D',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          dense: true,
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                            color: MyColors.grayScale[200],
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Não há ofertas para listar',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: notifier.darkTheme
                                  ? MyColors.primary[300]
                                  : MyColors.primary[700],
                            ),
                          ),
                        ),
                ]);
              }
              else{
                MyHomeView = ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        AppBar(
                          elevation: 0.5,
                          automaticallyImplyLeading: false,
                          backgroundColor: notifier.darkTheme
                              ? MyColors.darkGrayScale[500]
                              : const Color(0xFFFAFAFA),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/svg_icons/logo.svg',
                                fit: BoxFit.contain,
                                height: 28,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  'App Coleta',
                                  style: TextStyle(
                                      color: notifier.darkTheme
                                          ? MyColors.primary[300]
                                          : MyColors.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Roboto'),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 10,
                        ),
                        ListTile(
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/pedro_avatar.jpg'),
                          ),
                          title: const Text(
                            'Pedro Henrique',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                          subtitle: const Text(
                            'Fl 11, Q. 18, 14D',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          dense: true,
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            size: 40,
                            color: MyColors.grayScale[200],
                          ),
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text(
                            'Em andamento',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: notifier.darkTheme
                                  ? MyColors.primary[300]
                                  : MyColors.primary[700],
                            ),
                          ),
                        ),

                        //Aqui começa a listagem de ofertas

                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: ofertaController.ofertas.value.length,
                          itemBuilder: (context, index) {

                            final oferta = ofertaController.ofertas.value[index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                              'assets/images/caio_avatar.jpg',
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  oferta.tipo_material,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Container(
                                                  height: 3,
                                                ),
                                                Text(
                                                  oferta.estado,
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      color: notifier.darkTheme
                                                          ? Colors.grey[400]
                                                          : Colors.grey[700]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lista da Transação:',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto'),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '\u2022 ${oferta.peso.toString()}3kg de latinha',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Text(
                                                    '\u2022 ${oferta.valor.toString()} reais',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Marcado para:',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1,
                                                ),
                                                Text(
                                                  oferta.agendamento,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Ver',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {

                                              //Cancelar proposta
                                              ofertaController.deleteOferta(idOferta: oferta.id_oferta).then((result){
                                                setState(() {
                                                  ofertaController.ofertas.value.removeAt(index);
                                                });
                                              });

                                            },
                                            child: const Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  child: ScrollConfiguration(
                    behavior: ScrollRemove(),
                    child: MyHomeView,
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
