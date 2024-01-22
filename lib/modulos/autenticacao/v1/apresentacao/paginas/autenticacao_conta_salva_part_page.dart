part of 'autenticacao_page.dart';

class EtapaEntrarContaSalva extends StatefulWidget {
  const EtapaEntrarContaSalva({
    super.key,
    required this.autenticacaoFormulario,
  });

  final AutenticacaoFormulario autenticacaoFormulario;

  @override
  State<EtapaEntrarContaSalva> createState() => _EtapaEntrarContaSalvaState();
}

class _EtapaEntrarContaSalvaState extends State<EtapaEntrarContaSalva> {
  final _keyEntrarContaSalva = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        AutoSizeText(
          'Acessar Conta',
          style: GoogleFonts.barlow(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 8, 30, 96),
          ),
          maxLines: 1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.075,
          ),
          child: Form(
            key: _keyEntrarContaSalva,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BotaoListaContaSalva(
                  contaSalva: context.read<AutenticacaoBloc>().state.ultimaContaAcessada!,
                  exibirBorda: false,
                ),
                if (!context.read<AutenticacaoBloc>().state.ultimaContaAcessada!.autenticarComDigital)
                  Column(
                    children: [
                      CampoSenhaFormulario(
                        label: 'Senha da Internet',
                        valorPadrao: '87654321',
                        onSaved: (valor) => widget.autenticacaoFormulario.senha = valor,
                      ),
                      if (context.read<AutenticacaoBloc>().state.dispositivoPossuiBiometria)
                        SwitchSalvarDigital(
                          value: widget.autenticacaoFormulario.usarDigital,
                          onChanged: () {
                            setState(() {
                              widget.autenticacaoFormulario.usarDigital = !widget.autenticacaoFormulario.usarDigital;
                            });
                          },
                        ),
                    ],
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                BotaoSecundario(
                  texto: "Entrar com outra conta",
                  onPressed: () {
                    context.read<AutenticacaoBloc>().add(AutenticacaoEventListarContasSalvas());
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.025,
                ),
                BotaoPrincipal(
                  texto: "Entrar",
                  onPressed: () {
                    if (_keyEntrarContaSalva.currentState!.validate()) {
                      _keyEntrarContaSalva.currentState!.save();
                      FocusManager.instance.primaryFocus?.unfocus();
                      context
                          .read<AutenticacaoBloc>()
                          .add(AutenticacaoEventAutenticar(formulario: widget.autenticacaoFormulario));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        const TextNumeroVersao(
          numeroVersao: "v1.0",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}
