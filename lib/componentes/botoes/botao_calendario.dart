import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

class BotaoCalendario extends StatelessWidget {
  final DateTime data;
  final Function(DateTime dataSelecionada) aoSelecionarData;

  const BotaoCalendario({
    super.key,
    required this.data,
    required this.aoSelecionarData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: InternetBankingCores.cinza_300,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.025),
            SvgPicture.asset(
              'assets/icons/calendario.svg',
              width: 35,
              height: 35,
            ),
            const VerticalDivider(
              color: InternetBankingCores.cinza_300,
              indent: 10,
              endIndent: 10,
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(data),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: InternetBankingCores.azul_500,
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        var dataSelecionada = await showDatePicker(
          context: context,
          firstDate: DateTime.utc(2000, 1, 1),
          lastDate: DateTime.now(),
          cancelText: "Cancelar",
          confirmText: "Confirmar",
          fieldLabelText: "Data",
          initialDate: data,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: InternetBankingCores.azul_500,
                  onPrimary: InternetBankingCores.branco_100,
                  onSurface: InternetBankingCores.azul_500,
                ),
                buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: InternetBankingCores.azul_500,
                  ),
                ),
              ),
              child: child!,
            );
          },
          keyboardType: const TextInputType.numberWithOptions(),
        );

        if (dataSelecionada != null) aoSelecionarData(dataSelecionada);
      },
    );
  }
}
