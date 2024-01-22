part of 'cadastrar_dispositivo_page.dart';

class EtapaAvisoPrimeiraHabilitacao extends StatefulWidget {
  const EtapaAvisoPrimeiraHabilitacao({super.key});

  @override
  State<EtapaAvisoPrimeiraHabilitacao> createState() => _EtapaAvisoPrimeiraHabilitacaoState();
}

class _EtapaAvisoPrimeiraHabilitacaoState extends State<EtapaAvisoPrimeiraHabilitacao> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CadastrarDispositivoBloc, CadastrarDispositivoState>(
      builder: (context, state) {
        return LayoutPadrao(
          titulo: "Cadastro BPToken",
          subtitulo: "Habilitação do Dispositivo",
          conteudo: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text.rich(
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 30, 96),
                  ),
                  TextSpan(children: <TextSpan>[
                    TextSpan(text: "Aviso: ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "O seu Cartão de Segurança será válido até "),
                    TextSpan(text: "xx/xx/xxxx (DATA CARÊNCIA). ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Após, Será necessário habilitar seu dispositivo para obter o BPToken e continuar validando as suas operações.")
                  ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text(
                  "Seu dispositivo, apelido \"${state.nomeDispositivo}\" foi cadastrado com sucesso!",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 8, 30, 96),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                const Text(
                  "Para habilita-lo, dirija-se a um caixa eletrônico Banpará e siga as orientações abaixo:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 30, 96),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                const Text(
                  "Acesse: Outros Serviços >> Segurança e Acesso >> BPToken >> Habilitar Dispositivo",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 30, 96),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                const Text(
                  "Escolha o dispositivo com o apelido cadastrado e confirme a habilitação",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 30, 96),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                const Text(
                  "Lembre-se de leva-lo, pois ele pode ser utilizado no processo.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 30, 96),
                  ),
                ),
              ],
            ),
          ),
          rodape: [
            BotaoSecundario(
              texto: "Guia de Habilitação",
              onPressed: () => context.read<CadastrarDispositivoBloc>().add(EventoIrParaGuiaHabilitacao()),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            BotaoPrincipal(
              texto: "Ciente e de acordo",
              onPressed: () => context.read<CadastrarDispositivoBloc>().add(EventoFinalizar()),
            )
          ],
          acaoVoltar: () => context.read<CadastrarDispositivoBloc>().add(EventoLogoff()),
        );
      },
    );
  }
}
