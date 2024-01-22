import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/configuracao/fabrica.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/seletor_empresa_conta_token.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/apresentacao/componentes/visor_token_multifatorial.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/blocs/gerar_token_bloc.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/conta_token.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/empresa_token.dart';

class GerarTokenPage extends StatefulWidget {
  const GerarTokenPage({super.key});

  @override
  State<GerarTokenPage> createState() => _GerarTokenPageState();
}

class _GerarTokenPageState extends State<GerarTokenPage> {
  List<EmpresaToken> empresas = [
    EmpresaToken(
      nome: 'VIBE TECNOLOGIA',
      cnpj: '00.000.000/0000-00',
      contas: [
        ContaToken(agencia: '00', conta: '00000-0', cpf: '016.736.012-43'),
        ContaToken(agencia: '11', conta: '11111-1', cpf: '332.111.162-49'),
        ContaToken(agencia: '11', conta: '11111-1', cpf: '016.736.012-43'),
        ContaToken(agencia: '11', conta: '11111-1', cpf: '332.111.162-49'),
        ContaToken(agencia: '11', conta: '11111-1', cpf: '016.736.012-43'),
      ],
    ),
    EmpresaToken(
      nome: 'MASTER SUPPORT',
      cnpj: '11.111.111/1111-11',
      contas: [
        ContaToken(agencia: '22', conta: '22222-2', cpf: '016.736.012-43'),
        ContaToken(agencia: '33', conta: '33333-3', cpf: '016.736.012-43'),
      ],
    ),
    EmpresaToken(
      nome: 'DNX BRASIL',
      cnpj: '22.222.222/2222-22',
      contas: [
        ContaToken(agencia: '44', conta: '44444-4', cpf: '016.736.012-43'),
        ContaToken(agencia: '55', conta: '55555-5', cpf: '016.736.012-43'),
      ],
    ),
    EmpresaToken(
      nome: 'DNX BRASIL',
      cnpj: '33.333.333/3333-33',
      contas: [
        ContaToken(agencia: '44', conta: '44444-4', cpf: '016.736.012-43'),
      ],
    ),
    EmpresaToken(
      nome: 'DNX BRASIL',
      cnpj: '44.444.444/4444-44',
      contas: [
        ContaToken(agencia: '44', conta: '44444-4', cpf: '016.736.012-43'),
        ContaToken(agencia: '55', conta: '55555-5', cpf: '016.736.012-43'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => fabrica<GerarTokenBloc>(),
      child: BlocListener<GerarTokenBloc, GerarTokenState>(
        listener: (context, state) {
          if (state.etapa == GerarTokenEtapa.contaSelecionada) {
            context.read<GerarTokenBloc>().add(GerarTokenEventDisparar());
          }
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: InternetBankingCores.cinza_200,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.005,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    color: InternetBankingCores.cinza_300,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Código BP Token",
                  style: GoogleFonts.barlow(
                    color: InternetBankingCores.azul_500,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const VisorTokenMultifatorial(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Expanded(
                  child: BlocBuilder<GerarTokenBloc, GerarTokenState>(
                    buildWhen: (previous, current) {
                      return current.etapa == GerarTokenEtapa.empresaSelecionada ||
                          current.etapa == GerarTokenEtapa.contaSelecionada;
                    },
                    builder: (context, state) {
                      return Scrollbar(
                        child: ScrollConfiguration(
                          behavior: const ScrollBehavior().copyWith(overscroll: false),
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: MediaQuery.of(context).size.height * 0.025,
                            ),
                            itemCount: empresas.length,
                            itemBuilder: (context, index) {
                              return SeletorEmpresaContaToken(
                                empresa: empresas[index],
                                expandido: state.empresaSelecionada == empresas[index],
                                contaSelecionada: state.contaSelecionada,
                                aoSelecionarEmpresa: (EmpresaToken empresaSelecionada) {
                                  context
                                      .read<GerarTokenBloc>()
                                      .add(GerarTokenEventEmpresaSelecionada(empresaSelecionada: empresaSelecionada));
                                },
                                aoSelecionarConta: (ContaToken contaSelecionada) {
                                  context
                                      .read<GerarTokenBloc>()
                                      .add(GerarTokenEventCpfSelecionado(contaSelecionada: contaSelecionada));
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
