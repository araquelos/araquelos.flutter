import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/gerar_token_bloc.dart';

class VisorTokenMultifatorial extends StatefulWidget {
  const VisorTokenMultifatorial({
    super.key,
  });

  @override
  State<VisorTokenMultifatorial> createState() => _VisorTokenMultifatorialState();
}

class _VisorTokenMultifatorialState extends State<VisorTokenMultifatorial> {
  int _duracaoToken = 0;
  Timer? _timerToken;

  void _iniciarContador(int duracaoToken) {
    _duracaoToken = duracaoToken;
    _timerToken = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_duracaoToken > 0) {
        setState(() {
          _duracaoToken--;
        });
      } else {
        context.read<GerarTokenBloc>().add(GerarTokenEventDisparar());
      }
    });
  }

  @override
  void dispose() {
    if (_timerToken != null) _timerToken!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GerarTokenBloc, GerarTokenState>(
      listener: (context, state) {
        if (_timerToken != null) _timerToken!.cancel();

        if (state.etapa == GerarTokenEtapa.tokenGerado) {
          _iniciarContador(state.duracaoToken!);
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 206, 210, 218),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          color: const Color.fromARGB(255, 253, 253, 253),
        ),
        child: BlocBuilder<GerarTokenBloc, GerarTokenState>(
          builder: (context, state) {
            if (state.etapa == GerarTokenEtapa.processando) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 242, 244, 247),
                  color: InternetBankingCores.azul_500,
                ),
              );
            } else {
              return Stack(
                children: [
                  Center(
                    child: Text(
                      state.token ?? "------",
                      style: GoogleFonts.barlow(
                        color: InternetBankingCores.azul_500,
                        fontWeight: FontWeight.w600,
                        fontSize: 46,
                        letterSpacing: 10,
                      ),
                    ),
                  ),
                  if (state.etapa == GerarTokenEtapa.tokenGerado)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Stack(
                        children: [
                          Container(
                            height: 5,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 5,
                            width: ((MediaQuery.of(context).size.width * 0.85) * _duracaoToken) / 60,
                            decoration: const BoxDecoration(
                              color: InternetBankingCores.azul_500,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
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
    );
  }
}
