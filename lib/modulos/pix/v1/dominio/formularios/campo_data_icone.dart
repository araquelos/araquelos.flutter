import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/constantes/internet_banking_assets.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/data_validador.dart';

class CampoDataIcone extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(String?)? onSaved;

  final String? valorPadrao;

  const CampoDataIcone({
    super.key,
    this.label,
    required this.onSaved,
    this.valorPadrao,
    this.controller,
  });

  @override
  State<CampoDataIcone> createState() => _CampoDataIconeState();
}

class _CampoDataIconeState extends State<CampoDataIcone> {
  @override
  Widget build(BuildContext context) {
    return CampoTextoFormulario(
      controller: widget.controller,
      validator: dataValidador,
      label: widget.label ?? 'Data',
      hintText: 'dd/mm/aaaa',
      keyboardType: TextInputType.number,
      onSaved: widget.onSaved,
      inputFormatter: [
        FilteringTextInputFormatter.digitsOnly,
        DataInputFormatter(),
      ],
      prefixIcon: UnconstrainedBox(
        child: Container(
          padding: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.transparent),
              left: BorderSide(color: Colors.transparent),
              right: BorderSide(color: InternetBankingCores.azul_500, width: 1),
              bottom: BorderSide(color: Colors.transparent),
            ),
          ),
          child: SvgPicture.asset(
            InternetBankingAssetsIcones.calendarioSolido,
            height: 37,
            width: 22,
            // ignore: deprecated_member_use
            color: InternetBankingCores.azul_500,
          ),
        ),
      ),
    );
  }
}
