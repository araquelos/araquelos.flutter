import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/telefone_validador.dart';

class CampoTelefoneFormulario extends StatefulWidget {
  final String? label;
  final Function(String?)? onSaved;

  final String? initialValue;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String? string)? validator;

  const CampoTelefoneFormulario({
    super.key,
    this.label,
    required this.onSaved,
    this.initialValue,
    this.hintText,
    this.controller,
    this.validator,
  });

  @override
  State<CampoTelefoneFormulario> createState() => _CampoTelefoneFormularioState();
}

class _CampoTelefoneFormularioState extends State<CampoTelefoneFormulario> {
  @override
  Widget build(BuildContext context) {
    return CampoTextoFormulario(
      controller: widget.controller,
      validator: widget.validator ?? validarTelefone,
      label: widget.label ?? 'Telefone',
      initialValue: widget.initialValue,
      hintText: widget.hintText ?? 'Digite o telefone',
      maxLength: 15,
      inputFormatter: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      onSaved: widget.onSaved,
      keyboardType: TextInputType.number,
    );
  }
}
