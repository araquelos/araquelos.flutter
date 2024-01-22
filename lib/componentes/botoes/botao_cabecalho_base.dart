import 'package:flutter/material.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

enum BotaoTemaEnum {
  transparente,
  solido,
}

class BotaoCabecalhoBase extends StatefulWidget {
  final BotaoTemaEnum tema;

  final Widget conteudo;
  final double? tamanhoBotao;
  final Function() funcao;
  final Widget? tag;
  final bool tagPisca;

  const BotaoCabecalhoBase({
    super.key,
    required this.tema,
    required this.conteudo,
    required this.funcao,
    this.tamanhoBotao,
    this.tag,
    this.tagPisca = false,
  });

  @override
  State<BotaoCabecalhoBase> createState() => _BotaoCabecalhoBaseState();
}

class _BotaoCabecalhoBaseState extends State<BotaoCabecalhoBase> with SingleTickerProviderStateMixin {
  late AnimationController _fadeAnimationController;

  @override
  void initState() {
    if (widget.tag != null) {
      _fadeAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
        upperBound: 0.8,
        lowerBound: 0.4,
      );

      _fadeAnimationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _fadeAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _fadeAnimationController.forward();
        }
      });
      _fadeAnimationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.tag != null) {
      _fadeAnimationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: switch (widget.tema) {
        BotaoTemaEnum.transparente => const Color.fromARGB(40, 255, 255, 255),
        BotaoTemaEnum.solido => InternetBankingCores.azul_100,
      },
      borderRadius: BorderRadius.circular(
        widget.tamanhoBotao != null ? (widget.tamanhoBotao! * 0.1923) : MediaQuery.of(context).size.width * 0.025,
      ),
      child: InkWell(
        onTap: widget.funcao,
        borderRadius: BorderRadius.circular(
          widget.tamanhoBotao != null ? (widget.tamanhoBotao! * 0.1923) : MediaQuery.of(context).size.width * 0.025,
        ),
        child: Ink(
          height: widget.tamanhoBotao ?? MediaQuery.of(context).size.width * 0.13,
          width: widget.tamanhoBotao ?? MediaQuery.of(context).size.width * 0.13,
          child: Stack(
            children: [
              Center(
                child: widget.conteudo,
              ),
              Builder(
                builder: (context) {
                  if (widget.tag == null) return Container();

                  return Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: Offset(
                        MediaQuery.of(context).size.width * 0.005,
                        -MediaQuery.of(context).size.width * 0.005,
                      ),
                      child: Builder(
                        builder: (context) {
                          if (widget.tagPisca) {
                            return FadeTransition(
                              opacity: _fadeAnimationController,
                              child: widget.tag,
                            );
                          } else {
                            return widget.tag!;
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
