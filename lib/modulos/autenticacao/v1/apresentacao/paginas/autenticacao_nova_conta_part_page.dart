part of 'autenticacao_page.dart';

class EtapaEntrarNovaConta extends StatefulWidget {
  const EtapaEntrarNovaConta({
    super.key,
  });

  @override
  State<EtapaEntrarNovaConta> createState() => _EtapaEntrarNovaContaState();
}

class _EtapaEntrarNovaContaState extends State<EtapaEntrarNovaConta> {
  final GlobalKey<FormState> _keyEntrarNovaConta = GlobalKey<FormState>();
  final AutenticacaoFormulario autenticacaoFormulario = AutenticacaoFormulario();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          'Acessar Conta',
          style: GoogleFonts.barlow(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 8, 30, 96),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.075,
          ),
          child: Form(
            key: _keyEntrarNovaConta,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CampoCpfFormulario(
                  valorPadrao: '036.416.942-72',
                  onSaved: (valor) => autenticacaoFormulario.cpf = valor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                CampoSenhaFormulario(
                  label: 'Senha da Internet',
                  valorPadrao: '87654321',
                  onSaved: (valor) => autenticacaoFormulario.senha = valor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                if (context.read<AutenticacaoBloc>().state.dispositivoPossuiBiometria)
                  SwitchSalvarDigital(
                    value: autenticacaoFormulario.usarDigital,
                    onChanged: () {
                      setState(() {
                        autenticacaoFormulario.usarDigital = !autenticacaoFormulario.usarDigital;
                      });
                    },
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                if (context.read<AutenticacaoBloc>().state.ultimaContaAcessada != null)
                  Column(
                    children: [
                      BotaoSecundario(
                        texto: "Entrar com outra conta",
                        onPressed: () {
                          if (context.read<AutenticacaoBloc>().state.listaContasSalvas!.length == 1) {
                            context.read<AutenticacaoBloc>().add(AutenticacaoEventIniciar());
                          } else {
                            context.read<AutenticacaoBloc>().add(AutenticacaoEventListarContasSalvas());
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.025,
                      ),
                    ],
                  ),
                BotaoPrincipal(
                  texto: "Entrar",
                  onPressed: () {
                    if (_keyEntrarNovaConta.currentState!.validate()) {
                      _keyEntrarNovaConta.currentState!.save();
                      FocusManager.instance.primaryFocus?.unfocus();
                      context
                          .read<AutenticacaoBloc>()
                          .add(AutenticacaoEventAutenticar(formulario: autenticacaoFormulario));
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
