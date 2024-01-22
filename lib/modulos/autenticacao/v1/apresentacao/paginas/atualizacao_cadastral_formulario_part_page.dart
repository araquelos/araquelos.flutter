part of 'atualizacao_cadastral_page.dart';

class AtualizacaoCadastralFormulario extends StatefulWidget {
  const AtualizacaoCadastralFormulario({super.key});

  @override
  State<AtualizacaoCadastralFormulario> createState() => _AtualizacaoCadastralFormularioState();
}

class _AtualizacaoCadastralFormularioState extends State<AtualizacaoCadastralFormulario> {
  final GlobalKey<FormState> _keyFormularioAtualizacaoCadastral = GlobalKey<FormState>();

  TextEditingController telefoneController = TextEditingController();
  TextEditingController telefoneConfirmacaoController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController emailConfirmacaoController = TextEditingController();

  ContatoFormulario contatoFormulario = ContatoFormulario();

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      titulo: 'Cadastro do Dispositivo',
      subtitulo: "Atualização Cadastral",
      conteudo: Scrollbar(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
            child: SingleChildScrollView(
              child: Form(
                key: _keyFormularioAtualizacaoCadastral,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informe e confirme seus dados de contato:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 30, 96),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    CampoTelefoneFormulario(
                      controller: telefoneController,
                      validator: (String? valor) {
                        if (telefoneController.value != telefoneConfirmacaoController.value) {
                          return InternetBankingStrings.telefoneConfirmacaoIguais;
                        }

                        return validarTelefone(valor);
                      },
                      onSaved: (valor) => contatoFormulario.telefone = valor,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    CampoTelefoneFormulario(
                      label: 'Confirmar Telefone',
                      hintText: 'Confirme o telefone',
                      validator: (String? valor) {
                        if (telefoneController.value != telefoneConfirmacaoController.value) {
                          return InternetBankingStrings.telefoneConfirmacaoIguais;
                        }

                        return validarTelefone(valor);
                      },
                      controller: telefoneConfirmacaoController,
                      onSaved: (valor) => contatoFormulario.confirmaTelefone = valor,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    CampoTextoFormulario(
                      label: 'E-mail',
                      hintText: "Digite o e-mail",
                      controller: emailController,
                      validator: (String? valor) {
                        if (emailController.value != emailConfirmacaoController.value) {
                          return InternetBankingStrings.emailConfirmacaoIguais;
                        }

                        return validarEmail(valor);
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (valor) => contatoFormulario.email = valor,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                    CampoTextoFormulario(
                      label: 'Confirmar E-mail',
                      hintText: 'Confirme o e-mail',
                      controller: emailConfirmacaoController,
                      validator: (String? valor) {
                        if (emailController.value != emailConfirmacaoController.value) {
                          return InternetBankingStrings.emailConfirmacaoIguais;
                        }

                        return validarEmail(valor);
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (valor) => contatoFormulario.confirmaEmail = valor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Avançar",
          onPressed: () {
            if (_keyFormularioAtualizacaoCadastral.currentState!.validate()) {
              _keyFormularioAtualizacaoCadastral.currentState!.save();
              FocusManager.instance.primaryFocus?.unfocus();
              {
                context.read<AtualizacaoCadastralBloc>().add(EventoEnviarSMSToken());
              }
            }
          },
        ),
      ],
      acaoVoltar: () => context.read<AtualizacaoCadastralBloc>().add(EventoIrParaAviso()),
    );
  }
}
