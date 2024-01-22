part of 'cadastrar_dispositivo_page.dart';

class EtapaErroMultifatorial extends StatefulWidget {
  const EtapaErroMultifatorial({super.key});

  @override
  State<EtapaErroMultifatorial> createState() => _EtapaErroMultifatorialState();
}

class _EtapaErroMultifatorialState extends State<EtapaErroMultifatorial> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CadastrarDispositivoBloc, CadastrarDispositivoState>(
      builder: (context, state) {
        return LayoutPadrao(
          titulo: "Cadastro do Dispositivo",
          subtitulo: "Falha",
          conteudo: Text(
            state.mensagemErroMultifatorial!,
          ),
          rodape: [
            BotaoPrincipal(
              texto: "Continuar",
              onPressed: () {
                context.read<CadastrarDispositivoBloc>().add(EventoFinalizar());
              },
            ),
          ],
          acaoVoltar: () => context.read<CadastrarDispositivoBloc>().add(EventoLogoff()),
        );
      },
    );
  }
}
