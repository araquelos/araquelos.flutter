import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class CampoTextoFormulario extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;

  const CampoTextoFormulario({
    super.key,
    required this.label,
    this.hintText,
    this.obscureText = false,
    this.maxLength,
    this.validator,
    this.controller,
    this.inputFormatter,
    this.keyboardType,
    required this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
  });

  @override
  State<CampoTextoFormulario> createState() => _CampoTextoFormularioState();
}

class _CampoTextoFormularioState extends State<CampoTextoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: GoogleFonts.barlow(
              fontSize: 14,
              color: const Color.fromARGB(255, 8, 30, 96),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          onSaved: widget.onSaved,
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          validator: widget.validator,
          style: GoogleFonts.barlow(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: InternetBankingCores.azul_500,
          ),
          inputFormatters: widget.inputFormatter,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            counterText: "",
            hintText: widget.hintText ?? widget.label,
            hintStyle: GoogleFonts.barlow(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 99, 112, 131),
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(255, 206, 210, 218)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: InternetBankingCores.azul_500, width: 1.8),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: InternetBankingCores.vermelho_500),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: InternetBankingCores.azul_500, width: 1.8),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
