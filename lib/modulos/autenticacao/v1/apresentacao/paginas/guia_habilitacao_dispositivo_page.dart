import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/componentes/layouts/placeholder_carregamento.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/guia_habilitacao_dispositivo_bloc.dart';

class GuiaHabilitacaoDispositivoPage extends StatefulWidget {
  const GuiaHabilitacaoDispositivoPage({super.key});

  @override
  State<GuiaHabilitacaoDispositivoPage> createState() => _GuiaHabilitacaoDispositivoPageState();
}

class _GuiaHabilitacaoDispositivoPageState extends State<GuiaHabilitacaoDispositivoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GuiaHabilitacaoDispositivoBloc, GuiaHabilitacaoDispositivoState>(
      listener: (context, state) {
        if (state.rotaDestino != null) context.go(state.rotaDestino!);
      },
      builder: (context, state) {
        return LayoutPadrao(
          titulo: "Guia de Habilitação do Dispositivo",
          subtitulo: switch (state.etapa) {
            null => "",
            GuiaHabilitacaoDispositivoEtapa.pagina1 => "Titulo temporário",
            GuiaHabilitacaoDispositivoEtapa.pagina2 => "Titulo temporário",
            GuiaHabilitacaoDispositivoEtapa.pagina3 => "Titulo temporário",
            GuiaHabilitacaoDispositivoEtapa.pagina4 => "No dispositivo HABILITADO você poderá:",
            GuiaHabilitacaoDispositivoEtapa.pagina5 => "Como gerar o seu código BPToken",
            GuiaHabilitacaoDispositivoEtapa.pagina6 => "Como gerar o seu código BPToken",
            GuiaHabilitacaoDispositivoEtapa.pagina7 => "Proteja seu BPToken!",
          },
          conteudo: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Builder(
              builder: (context) {
                switch (state.etapa) {
                  case null:
                    return const PlaceholderCarregamento();
                  case GuiaHabilitacaoDispositivoEtapa.pagina1:
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Caro cliente, para que você consiga efetivar suas operações financeiras no Internet Banking do Banpará você precisará HABILITAR seu dispositivo cadastrado.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image(
                                    image: AssetImage("assets/images/multifatorial_guia1@1x.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Text(
                                  'A Habilitação é rápida e confiável,  e lhe proporciona mais tranquilidade e segurança!',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Veja como realizar a habilitação a seguir.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  case GuiaHabilitacaoDispositivoEtapa.pagina2:
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                const Text(
                                  'Vá até um Caixa Eletrônico do Banpará com o seu Cartão Banpará e o dispositivo cadastrado, ele poderá ser solicitado no processo de habilitação.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Caso não possua o cartão, entre em contato com a sua agência de relacionamento.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image(
                                    image: AssetImage("assets/images/multifatorial_guia2@1x.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Text(
                                  'No Caixa Eletrônico do Banpará, habilite seu dispositivo cadastrado selecionando as seguintes opções na tela:',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Outros serviços > Segurança e Acesso > BPToken > Habilitar Dispositivo',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  case GuiaHabilitacaoDispositivoEtapa.pagina3:
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Na tela do Caixa Eletrônico, selecione o APELIDO do dispositivo que você cadastrou. Pronto, seu dispositivo está HABILITADO!',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image(
                                    image: AssetImage("assets/images/multifatorial_guia3@1x.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Text(
                                  'ATENÇÃO!',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Nunca habilite um dispositivo que você não lembra ter cadastrado. Na dúvida, refaça a etapa de cadastro de apelido para o seu dispositivo.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Para mais informações, entre em contato com o SAC Banpará: 0800 280 6605',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  case GuiaHabilitacaoDispositivoEtapa.pagina4:
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image(
                                    image: AssetImage("assets/images/multifatorial_guia1@1x.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const Text(
                                  'Efetivar operações financeiras automaticamente;',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Gerar código BPToken para acessar ou efetivar operação financeira nos canais Banpará: Internet Banking no computador,  Central Banpará;',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Para gerar o código BPToken, veja o passo a seguir.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  case GuiaHabilitacaoDispositivoEtapa.pagina5:
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image(
                                    image: AssetImage("assets/images/multifatorial_guia4@1x.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Acesse o seu Aplicativo Banpará no dispositivo HABILITADO e clique na CHAVE, como indicada na imagem acima.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  case GuiaHabilitacaoDispositivoEtapa.pagina6:
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: Image(
                                    image: AssetImage("assets/images/multifatorial_guia5@1x.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                                const Text(
                                  'Clique na sua conta mostrada no dispositivo. Pronto, o aplicativo irá gerar seu código BPToken!',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 8, 30, 96),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  case GuiaHabilitacaoDispositivoEtapa.pagina7:
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                width: 250,
                                height: 250,
                                child: Image(
                                  image: AssetImage("assets/images/multifatorial_guia6@1x.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Lembre-se sempre:',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 8, 30, 96),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                              const Text(
                                'O Banpará não envia links via SMS, E-mail, Whatsapp, e nem liga solicitando senhas e/ou código BPToken.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 8, 30, 96),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                              const Text(
                                'Não forneça suas senhas e códigos BPToken para outras pessoas!',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 8, 30, 96),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                              const Text(
                                'NUNCA habilite dispositivos de outras pessoas.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 8, 30, 96),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                              const Text(
                                'Para mais informações, entre em contato com o SAC Banpará: 0800 280 6605.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 8, 30, 96),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ),
          rodape: [
            BotaoPrincipal(
              texto: state.etapa == GuiaHabilitacaoDispositivoEtapa.pagina7 ? "Finalizar" : "Próximo",
              onPressed: () => context.read<GuiaHabilitacaoDispositivoBloc>().add(EventoNavegarProximo()),
            )
          ],
          acaoVoltar: () => context.read<GuiaHabilitacaoDispositivoBloc>().add(EventoNavegarAnterior()),
        );
      },
    );
  }
}
