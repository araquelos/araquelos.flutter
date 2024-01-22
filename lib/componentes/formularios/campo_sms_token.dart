import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/token_validador.dart';

class CampoSmsToken extends StatefulWidget {
  final String? label;
  final String? hintText;
  final Function(String?)? onSaved;

  const CampoSmsToken({
    super.key,
    this.label,
    this.hintText,
    this.onSaved,
  });

  @override
  State<CampoSmsToken> createState() => _CampoSmsTokenState();
}

class _CampoSmsTokenState extends State<CampoSmsToken> {
  @override
  Widget build(BuildContext context) {
    return CampoTextoFormulario(
      validator: validarToken,
      label: "",
      hintText: widget.hintText,
      maxLength: 6,
      keyboardType: TextInputType.number,
      onSaved: widget.onSaved,
      inputFormatter: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      suffixIcon: UnconstrainedBox(
        child: Container(
          height: 35,
          width: 35,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Color.fromARGB(255, 244, 245, 249),
          ),
          child: const Icon(
            Icons.lock,
            color: InternetBankingCores.azul_500,
            size: 20,
          ),
        ),
      ),
    );
  }
}
