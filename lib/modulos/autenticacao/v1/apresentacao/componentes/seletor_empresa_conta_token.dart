import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/conta_token.dart';
import 'package:mobile_pj/modulos/autenticacao/v1/dominio/modelos/empresa_token.dart';

class SeletorEmpresaContaToken extends StatelessWidget {
  final EmpresaToken empresa;
  final bool expandido;
  final ContaToken? contaSelecionada;
  final Function(EmpresaToken) aoSelecionarEmpresa;
  final Function(ContaToken) aoSelecionarConta;

  const SeletorEmpresaContaToken({
    super.key,
    required this.empresa,
    required this.expandido,
    required this.contaSelecionada,
    required this.aoSelecionarEmpresa,
    required this.aoSelecionarConta,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.09,
            ),
            child: AnimatedContainer(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
                maxHeight: MediaQuery.of(context).size.height * 0.18,
              ),
              height: expandido ? null : 0,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 253, 253),
                border: Border.all(
                  color: const Color.fromARGB(255, 206, 210, 218),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(height: 1),
                shrinkWrap: true,
                itemCount: empresa.contas.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      aoSelecionarConta(empresa.contas[index]);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: const EdgeInsets.fromLTRB(20, 18, 10, 18),
                      decoration: BoxDecoration(
                        color:
                            empresa.contas[index] == contaSelecionada ? const Color.fromARGB(255, 228, 231, 236) : null,
                        borderRadius: index == (empresa.contas.length - 1)
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )
                            : null,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'CPF: ',
                            style: GoogleFonts.barlow(
                              color: const Color.fromARGB(255, 8, 30, 96),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            empresa.contas[index].cpf,
                            style: GoogleFonts.barlow(
                              color: const Color.fromARGB(255, 47, 54, 142),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              aoSelecionarEmpresa(empresa);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    offset: const Offset(0, 3),
                    blurRadius: 15.0,
                    spreadRadius: 3.0,
                  ),
                ],
                color: const Color.fromARGB(255, 253, 253, 253),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    size: 40,
                    color: InternetBankingCores.azul_500,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nome:",
                        style: GoogleFonts.barlow(
                          color: InternetBankingCores.azul_500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "CNPJ:",
                        style: GoogleFonts.barlow(
                          color: InternetBankingCores.azul_500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        empresa.nome,
                        style: GoogleFonts.barlow(
                          color: InternetBankingCores.azul_500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        empresa.cnpj,
                        style: GoogleFonts.barlow(
                          color: InternetBankingCores.azul_500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: expandido ? 1 / 4 : 3 / 4,
                    duration: const Duration(milliseconds: 0),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: InternetBankingCores.azul_500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
