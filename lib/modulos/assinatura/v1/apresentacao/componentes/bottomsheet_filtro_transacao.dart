import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/botoes/botao_secundario.dart';
import 'package:mobile_pj/componentes/botoes/botao_selecionar.dart';
import 'package:mobile_pj/componentes/divisores/divisor_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/blocs/assinatura_bloc.dart';
import 'package:mobile_pj/modulos/assinatura/v1/dominio/enum/filtro_assinatura_tipo_transacao_enum.dart';

class BottomSheetFiltroTransacao extends StatefulWidget {
  final FiltroAssinaturaTipoTransacaoEnum? valorInicial;

  const BottomSheetFiltroTransacao({
    super.key,
    required this.valorInicial,
  });

  @override
  State<BottomSheetFiltroTransacao> createState() => _BottomSheetFiltroTransacaoState();
}

class _BottomSheetFiltroTransacaoState extends State<BottomSheetFiltroTransacao> {
  FiltroAssinaturaTipoTransacaoEnum? valorAtual;

  @override
  void initState() {
    valorAtual = widget.valorInicial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selecione um filtro",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: InternetBankingCores.azul_500,
              ),
            ),
            const DivisorPadrao(),
            Wrap(
              spacing: MediaQuery.of(context).size.width * 0.02,
              children: List.generate(
                FiltroAssinaturaTipoTransacaoEnum.values.length,
                (index) {
                  return BotaoSelecionar(
                    titulo: FiltroAssinaturaTipoTransacaoEnum.values[index].nome,
                    selecionado: valorAtual == FiltroAssinaturaTipoTransacaoEnum.values[index],
                    funcao: (_) => setState(() {
                      valorAtual = FiltroAssinaturaTipoTransacaoEnum.values[index];
                    }),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const DivisorPadrao(),
            Column(
              children: [
                BotaoSecundario(
                  texto: 'Limpar Filtro',
                  onPressed: () => setState(() {
                    valorAtual = null;
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                BotaoPrincipal(
                  texto: 'Filtrar',
                  onPressed: () {
                    context.read<AssinaturaBloc>().add(
                          AssinaturaEventMudarFiltro(
                            texto: "",
                            filtro: valorAtual!,
                          ),
                        );
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
