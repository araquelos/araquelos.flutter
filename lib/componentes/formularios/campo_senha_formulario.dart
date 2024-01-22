import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_pj/componentes/formularios/campo_texto_formulario.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/validadores/senha_validador.dart';

class CampoSenhaFormulario extends StatefulWidget {
  final String? label;
  final Function(String?)? onSaved;

  final String? valorPadrao;

  const CampoSenhaFormulario({
    super.key,
    this.label,
    required this.onSaved,
    this.valorPadrao,
  });

  @override
  State<CampoSenhaFormulario> createState() => _CampoSenhaFormularioState();
}

class _CampoSenhaFormularioState extends State<CampoSenhaFormulario> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CampoTextoFormulario(
      validator: senhaValidador,
      label: widget.label ?? 'Senha',
      initialValue: widget.valorPadrao,
      maxLength: 8,
      obscureText: _obscureText,
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
          child: IconButton(
            icon: Icon(
              // TODO Alterar pacote de ícones, pacote padrão do flutter não possui olho riscado
              _obscureText == true ? Icons.remove_red_eye : Icons.key,
              color: InternetBankingCores.azul_500,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
