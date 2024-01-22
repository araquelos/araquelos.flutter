import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/cpf_validador.dart';

class CampoCpfFormulario extends StatefulWidget {
  final String? label;
  final Function(String?)? onSaved;

  final String? valorPadrao;

  const CampoCpfFormulario({
    super.key,
    this.label,
    required this.onSaved,
    this.valorPadrao,
  });

  @override
  State<CampoCpfFormulario> createState() => _CampoCpfFormularioState();
}

class _CampoCpfFormularioState extends State<CampoCpfFormulario> {
  @override
  Widget build(BuildContext context) {
    return CampoTextoFormulario(
      validator: cpfValidador,
      label: widget.label ?? 'CPF',
      initialValue: widget.valorPadrao,
      maxLength: 14,
      inputFormatter: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter(),
      ],
      onSaved: widget.onSaved,
      keyboardType: TextInputType.number,
    );
  }
}
