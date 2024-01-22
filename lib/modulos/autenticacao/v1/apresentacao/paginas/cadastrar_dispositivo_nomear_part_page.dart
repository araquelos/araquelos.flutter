part of 'cadastrar_dispositivo_page.dart';

class EtapaNomearDispositivo extends StatefulWidget {
  const EtapaNomearDispositivo({
    super.key,
  });

  @override
  State createState() => _EtapaNomearDispositivoState();
}

class _EtapaNomearDispositivoState extends State<EtapaNomearDispositivo> {
  final GlobalKey<FormState> _keyNomearDispositivo = GlobalKey<FormState>();
  String? nomeDispositivo = "";

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Cadastro do Dispositivo',
      subtitulo: "Nomear Dispositivo",
      conteudo: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirme o nome do seu dispositivo',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 8, 30, 96)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
              child: BlocBuilder<CadastrarDispositivoBloc, CadastrarDispositivoState>(
                builder: (context, state) => Form(
                  key: _keyNomearDispositivo,
                  child: CampoTextoFormulario(
                    label: 'Nome do Dispositivo',
                    hintText: 'Digite o nome desejado',
                    initialValue: state.nomeDispositivo,
                    validator: nomeDispositivoValidador,
                    keyboardType: TextInputType.text,
                    onSaved: (valor) => nomeDispositivo = valor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Confirmar",
          onPressed: () {
            if (_keyNomearDispositivo.currentState!.validate()) {
              _keyNomearDispositivo.currentState!.save();
              FocusManager.instance.primaryFocus?.unfocus();
              context.read<CadastrarDispositivoBloc>().add(EventoDefinirNome(nomeDispositivo: nomeDispositivo!));
            }
          },
        ),
      ],
      acaoVoltar: () => context.read<CadastrarDispositivoBloc>().add(EventoIrParaAviso()),
    );
  }
}
