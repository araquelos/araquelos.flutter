import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/componentes/botoes/botao_destaque_base.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/auxiliares/conta_salva.dart';

class BotaoListaContaSalva extends StatelessWidget {
  final ContaSalva contaSalva;
  final bool exibirBorda;
  final Function()? aoClicar;
  final Function()? aoSegurar;

  const BotaoListaContaSalva({
    super.key,
    required this.contaSalva,
    this.exibirBorda = true,
    this.aoClicar,
    this.aoSegurar,
  });

  String _iniciaisContaSalva(String nome) {
    List<String> lista = nome.split(" ");
    return "${lista[0][0]}${lista.length > 1 ? lista[1][0] : ""}";
  }

  @override
  Widget build(BuildContext context) {
    return BotaoDestaqueBase(
      tema: BotaoDestaqueTemaEnum.lista,
      icone: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 47, 54, 142),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: AutoSizeText(
              _iniciaisContaSalva(contaSalva.nome),
              style: GoogleFonts.barlow(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      labelSuperior: "Nome",
      valorSuperior: contaSalva.nome,
      labelInferior: "CPF",
      valorInferior: UtilBrasilFields.obterCpf(contaSalva.cpf),
      negrito: true,
      exibirBorda: exibirBorda,
      aoClicar: aoClicar,
      aoSegurar: aoSegurar,
    );
  }
}
