import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_principal.dart';
import 'package:mobile_pj/componentes/layouts/layout_padrao.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_rotas.dart';
import 'package:mobile_pj/repositorios/comprovante_pix_repositorio.dart';

class PixPagarTransferirComprovante extends StatefulWidget {
  const PixPagarTransferirComprovante({super.key});

  @override
  State<PixPagarTransferirComprovante> createState() => _PixPagarTransferirComprovanteState();
}

class _PixPagarTransferirComprovanteState extends State<PixPagarTransferirComprovante> {
  @override
  Widget build(BuildContext context) {
    var comprovantePix = ComprovantePixRepositorio.comprovante;
    return LayoutPadrao(
      titulo: 'Pix - Comprovante',
      subtitulo: "",
      conteudo: Scrollbar(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 56,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(222, 222, 222, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Comprovante",
                          style: GoogleFonts.barlow(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 8, 30, 96),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 30,
                          width: 120,
                          child: Image.asset('assets/images/banpara-logo.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(228, 231, 236, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              InternetBankingAssetsIcones.database,
                              height: 18,
                              width: 18,
                              colorFilter: const ColorFilter.mode(Color.fromRGBO(8, 30, 96, 1), BlendMode.srcIn),
                            ),
                            const Text('  Dados de Origem',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(53, 28, 28, 1),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 89,
                              child: Text(
                                'Titular',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.titularOrigem,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 89,
                              child: Text(
                                'Agência',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.agenciaOrigem,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 89,
                              child: Text(
                                'Conta',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.contaOrigem,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 89,
                              child: Text(
                                'Tipo de Conta',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.tipoContaOrigem,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(228, 231, 236, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              InternetBankingAssetsIcones.database,
                              height: 18,
                              width: 18,
                              colorFilter: const ColorFilter.mode(Color.fromRGBO(8, 30, 96, 1), BlendMode.srcIn),
                            ),
                            const Text('  Dados de Destino',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(53, 28, 28, 1),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Instituição',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.instituicaoDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Titular',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.titularDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'CPF',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.cpfDestino != ''
                                    ? UtilBrasilFields.obterCpf(comprovantePix.cpfDestino)
                                    : '',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Agência',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.agenciaDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Conta',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.contaDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Tipo de Conta',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.tipoContaDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'ID',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.idDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Tipo de Pagamento',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.tipoPagamentoDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Finalidade',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.finalidadeDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Valor',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                UtilBrasilFields.obterReal(comprovantePix.valor, decimal: 2, moeda: true),
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Descrição',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.descricaoDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 110,
                              child: Text(
                                'Autenticação',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(74, 74, 74, 1),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                comprovantePix.autenticacaoDestino,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 30, 96, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Atenção',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(74, 74, 74, 1),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Informamos que poderá incidir tarifa sobre esta transação. Consulte nossa tabela de tarifas vigentes disponível no site institucional para maiores detalhes.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.1,
                          color: Color.fromRGBO(74, 74, 74, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text.rich(
                              textAlign: TextAlign.left,
                              style: TextStyle(letterSpacing: -0.1),
                              TextSpan(
                                text: 'Central Banpará\n',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(43, 43, 43, 0.8),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '(Belém e região metropolitanta, Marabá e Santarém)',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              '30044-444',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(43, 43, 43, 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text.rich(
                              textAlign: TextAlign.left,
                              style: TextStyle(letterSpacing: -0.1),
                              TextSpan(
                                text: 'Central Banpará\n',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(43, 43, 43, 0.8),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '(Demais localidades)',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              '0800 285 8080',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(43, 43, 43, 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text.rich(
                              textAlign: TextAlign.left,
                              style: TextStyle(letterSpacing: -0.1),
                              TextSpan(
                                text: 'SAC\n',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(43, 43, 43, 0.8),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '(Informações e reclamações)',
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              '0800 280 6605',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(43, 43, 43, 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text.rich(
                              textAlign: TextAlign.left,
                              style: TextStyle(letterSpacing: -0.1),
                              TextSpan(
                                text: 'SAC deficiente auditivo',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(43, 43, 43, 0.8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              '0800 280 1817',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(43, 43, 43, 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text.rich(
                              textAlign: TextAlign.left,
                              style: TextStyle(letterSpacing: -0.1),
                              TextSpan(
                                text: 'Ouvidoria',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(43, 43, 43, 0.8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              '0800 2809040',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(43, 43, 43, 0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      rodape: [
        BotaoPrincipal(
          texto: "Compartilhar",
          onPressed: () {},
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
      acaoVoltar: () => context.go(InternetBankingRotas.pixPagarTransferir),
    );
  }
}
