import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class CampoValorPix extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final Widget? suffixIcon;

  final String? valorPadrao;

  const CampoValorPix({
    super.key,
    required this.label,
    this.hintText,
    this.obscureText = false,
    this.maxLength,
    this.validator,
    this.controller,
    this.inputFormatter,
    this.keyboardType,
    this.onSaved,
    this.onTap,
    this.suffixIcon,
    this.valorPadrao,
  });

  @override
  State<CampoValorPix> createState() => _CampoValorPixState();
}

class _CampoValorPixState extends State<CampoValorPix> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      //height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: const Color.fromRGBO(206, 210, 218, 1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label,
                  style: GoogleFonts.barlow(
                    fontSize: 12,
                    color: const Color.fromRGBO(43, 43, 43, 0.8),
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: widget.controller ??
                TextEditingController(text: widget.valorPadrao),
            textAlign: TextAlign.center,
            onTap: widget.onTap,
            onSaved: widget.onSaved,
            maxLength: widget.maxLength,
            obscureText: widget.obscureText,
            validator: widget.validator,
            style: GoogleFonts.barlow(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: InternetBankingCores.azul_500,
            ),
            inputFormatters: widget.inputFormatter,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              counterText: "",
              hintText: widget.hintText ?? widget.label,
              hintStyle: GoogleFonts.barlow(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: InternetBankingCores.azul_500,
              ),
              isDense: true,
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              suffixIcon: widget.suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
