part of 'atualizacao_cadastral_page.dart';

class AtualizacaoCadastralSmsToken extends StatefulWidget {
  const AtualizacaoCadastralSmsToken({
    super.key,
  });

  @override
  State createState() => _AtualizacaoCadastralSmsTokenState();
}

class _AtualizacaoCadastralSmsTokenState extends State<AtualizacaoCadastralSmsToken> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 5);
  bool temporizadorToken = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 5
  void resetTimer() {
    temporizadorToken = true;
    setState(() => myDuration = const Duration(seconds: 5));
    startTimer();
  }

  void exibirBotoes() {
    temporizadorToken = false;
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        exibirBotoes();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    if (countdownTimer != null) countdownTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return LayoutPadrao(
      titulo: 'Cadastro do Dispositivo',
      subtitulo: "Atualização Cadastral",
      conteudo: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          children: [
            const Text(
              'Insira o  SMS token enviado para o número cadastrado',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Color.fromARGB(255, 8, 30, 96),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              MascaraUtils().mascararTelefone(
                ddd: context.read<AtualizacaoCadastralBloc>().state.dadosContato?.telefone.ddd,
                telefone: context.read<AtualizacaoCadastralBloc>().state.dadosContato?.telefone.numero,
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 8, 30, 96),
              ),
            ),
            const CampoSmsToken(
              label: '',
              hintText: "SMS Token",
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Center(
              child: Column(
                children: [
                  Text(
                    '$minutes:$seconds',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromARGB(255, 8, 30, 96),
                    ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                if (temporizadorToken == false) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Não recebeu o SMS Token?',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 30, 96),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                        Row(
                          children: [
                            Expanded(
                              child: BotaoSecundario(
                                texto: "Solicitar Chamada",
                                emLinha: true,
                                onPressed: () {
                                  context.go(InternetBankingRotas.autenticacao);
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: BotaoSecundario(
                                texto: "Reenviar SMS",
                                emLinha: true,
                                onPressed: () {
                                  resetTimer();
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Confirmar Código",
          onPressed: () {
            context.go(InternetBankingRotas.atualizacaoCadastralNomearDispositivo);
          },
        ),
      ],
      acaoVoltar: () => context.go(InternetBankingRotas.atualizacaoCadastralMultifatorial),
    );
  }
}
