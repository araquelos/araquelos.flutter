import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pj/componentes/delegates/cabecalho_saldo_delegate.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/home/v1/widgets/apresentacao/componentes/busca.dart';

class LayoutScrollSaldo extends StatelessWidget {
  final String titulo;
  final Widget conteudo;
  final Function() funcaoVoltar;
  final Function(String)? funcaoBuscarTexto;
  final List<Widget>? filtro;
  final Function()? funcaoLimparFiltro;
  final bool scrollHabilitado;
  final bool inicializacaoConcluida;
  final bool condicaoExibirBuscaTexto;
  final bool condicaoExibirFiltro;
  final bool condicaoExibirLimparFiltro;

  const LayoutScrollSaldo({
    super.key,
    required this.titulo,
    required this.conteudo,
    required this.funcaoVoltar,
    this.funcaoBuscarTexto,
    this.filtro,
    this.funcaoLimparFiltro,
    this.scrollHabilitado = true,
    this.inicializacaoConcluida = true,
    this.condicaoExibirBuscaTexto = true,
    this.condicaoExibirFiltro = true,
    this.condicaoExibirLimparFiltro = true,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        funcaoVoltar();
      },
      child: Scaffold(
        body: NestedScrollView(
          physics: scrollHabilitado ? null : const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, indicadorScrollado) {
            return [
              SliverPersistentHeader(
                pinned: true,
                delegate: CabecalhoSaldoDelegate(
                  titulo: titulo,
                  tamanhoMinimo: MediaQuery.of(context).size.height * 0.12,
                  tamanhoMaximo: MediaQuery.of(context).size.height * 0.285,
                  funcaoVoltar: funcaoVoltar,
                ),
              ),
            ];
          },
          body: Scrollbar(
            child: CustomScrollView(
              physics: scrollHabilitado ? null : const NeverScrollableScrollPhysics(),
              scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
              slivers: [
                SliverVisibility(
                  visible: funcaoBuscarTexto != null && condicaoExibirBuscaTexto && inicializacaoConcluida,
                  sliver: SliverPadding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.015,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Busca(
                        funcao: funcaoBuscarTexto!,
                      ),
                    ),
                  ),
                ),
                SliverVisibility(
                  visible: filtro != null && inicializacaoConcluida,
                  sliver: SliverToBoxAdapter(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                        height: condicaoExibirFiltro ? null : 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: const AutoSizeText(
                                "Filtrar por",
                                style: TextStyle(
                                  color: InternetBankingCores.azul_500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.045,
                              child: ScrollConfiguration(
                                behavior: const ScrollBehavior().copyWith(overscroll: false),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: filtro!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width * (0.01 + (index == 0 ? 0.04 : 0)),
                                        right: MediaQuery.of(context).size.width *
                                            (0.01 + (index == filtro!.length - 1 ? 0.04 : 0)),
                                      ),
                                      child: filtro![index],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                            Visibility(
                              visible:
                                  funcaoLimparFiltro != null && condicaoExibirLimparFiltro && inicializacaoConcluida,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IntrinsicWidth(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).size.height * 0.01,
                                      right: MediaQuery.of(context).size.width * 0.05,
                                    ),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 2,
                                          color: InternetBankingCores.azul_500,
                                        ),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: funcaoLimparFiltro,
                                      child: const Text(
                                        "Limpar filtros",
                                        style: TextStyle(
                                          color: InternetBankingCores.azul_500,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  sliver: conteudo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
