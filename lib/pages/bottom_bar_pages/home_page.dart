import 'package:app_coleta_lixo/data_api/http/http_client.dart';
import 'package:app_coleta_lixo/data_api/repositories/oferta_repository.dart';
import 'package:app_coleta_lixo/models/colors.dart';
import 'package:app_coleta_lixo/providers/oferta_controller.dart';
import 'package:app_coleta_lixo/providers/state_controller.dart';
import 'package:app_coleta_lixo/widgets/custom_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final OfertaController ofertaController = OfertaController(
    repository: OfertaRepository(
      client: HttpClient(),
      )
    );
  
  @override
  void initState() {
    super.initState();
    ofertaController.getOfertas();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  final offers = List.generate(100, (index) => "Offer $index");
  bool bottomBarVisibility = true;

  Future<bool> _onWillPop() async {
    return false;
  }

  Widget _body() {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnimatedBuilder(
          animation: Listenable.merge([
            AppController.instance,
            ofertaController.isLoading,
            ofertaController.erro,
            ofertaController.state,
          ]),
          builder: (context, child) {

            //Tela carregando as ofertas da API
            if(ofertaController.isLoading.value){
              return const Center(child: CircularProgressIndicator());
            }

            //Se não tiver vazio, significa que tem erro
            if (ofertaController.erro.value.isNotEmpty) {
              return Center(
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
            if (ofertaController.state.value.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhuma oferta na lista',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }

            //Lista todas as ofertas
            else{
              return SingleChildScrollView(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SafeArea(
                        child: ListView(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(
                          parent: FixedExtentScrollPhysics()
                        ),
                        children: [
                        AppBar(
                          elevation: 0.5,
                          automaticallyImplyLeading: false,
                          backgroundColor: AppController.instance.isDarkTheme
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
                                        horizontal: 8.0),
                                    child: Text(
                                      'App Coleta',
                                      style: TextStyle(
                                          color:
                                              AppController.instance.isDarkTheme
                                                  ? MyColors.primary[300]
                                                  : MyColors.primary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Roboto'),
                                    ))
                              ]),
                        ),
                        Container(height: 10),
                        ListTile(
                          leading: const CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                                  AssetImage('assets/images/pedro_avatar.jpg')),
                          title: const Text('Pedro Henrique',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto')),
                          subtitle: const Text('Fl 11, Q. 18, 14D',
                              style: TextStyle(
                                  fontSize: 13.0, fontFamily: 'Roboto')),
                          dense: true,
                          trailing: Icon(Icons.keyboard_arrow_right,
                              size: 40, color: MyColors.grayScale[200]),
                          onTap: () {
                            Navigator.pushNamed(context, '/regaddress');
                          },
                        ),
                        Container(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 16.0),
                          child: Text(
                            'Em andamento',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppController.instance.isDarkTheme
                                    ? MyColors.primary[300]
                                    : MyColors.primary[700]),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: ofertaController.state.value.length,
                          itemBuilder: (context, index) {

                            final oferta = ofertaController.state.value[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 10),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 25.0,
                                            backgroundImage: AssetImage(
                                              'assets/images/alex_avatar.jpg',
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                oferta.tipo_material,
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Container(height: 2),
                                              Text(
                                                oferta.estado,
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: AppController
                                                            .instance.isDarkTheme
                                                        ? Colors.grey[400]
                                                        : Colors.grey[700]),
                                              ),
                                              Container(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            child: const Text(
                                              'Lista da Transação:',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            child: Text(
                                              '\u2022 ${oferta.valor.toString()} reais',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            child: Text(
                                              '\u2022 ${oferta.peso.toString()} Kg',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                        ),
                                        const Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.0),
                                              child: SizedBox(
                                                width: 100,
                                                child: Text(
                                                  'Marcado para:',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Roboto'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 200),
                                          child: Text(
                                            '- 19 de julho de 2023',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Roboto'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              //Tela de Visualizar oferta
                                            },
                                            child: const Text(
                                              'Ver',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Roboto'),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              //Cancelar proposta
                                            },
                                            child: const Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Roboto'),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const DarkSwitch(),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login', (route) => false);
                              AppController.instance.isSignUpCheckboxConfirmed =
                                  false;
                              AppController.instance.occupationState = false;
                              AppController.instance.catadorState = false;
                              AppController.instance.coletorState = false;
                              AppController.instance.sucatariaState = false;
                            },
                            child: const Text(
                              'Sair da página de Menu Principal',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto'),
                            ))
                      ],
                  ))),
              );
            }
          }),
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
