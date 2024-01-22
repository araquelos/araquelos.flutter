import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pj/constantes/internet_banking_cores.dart';

/// Definição do tema da aplicação.
ThemeData mainTheme = ThemeData(
  useMaterial3: true,
  chipTheme: ChipThemeData(
      shape: RoundedRectangleBorder(
    side: const BorderSide(
      color: InternetBankingCores.azul_500, // Defina a cor desejada da borda
      width: 1.0, // Defina a largura desejada da borda
    ),
    borderRadius: BorderRadius.circular(20.0),
    // Ajuste o valor de '10.0' conforme necessário para alterar o raio da borda
  )),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.barlow(
      fontSize: 14,
      color: const Color.fromARGB(255, 99, 112, 131),
    ),
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
      borderSide: const BorderSide(color: InternetBankingCores.vermelho_500, width: 1.8),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: InternetBankingCores.azul_500,
  ),
  switchTheme: SwitchThemeData(
    trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return InternetBankingCores.azul_500;
      }
      return const Color.fromARGB(255, 206, 210, 218);
    }),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return InternetBankingCores.azul_500;
      }

      return const Color.fromARGB(255, 206, 210, 218);
    }),
    thumbColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        return Colors.white;
      },
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: InternetBankingCores.azul_400,
    surfaceTintColor: null,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    surfaceTintColor: null,
    dragHandleColor: Color.fromARGB(255, 222, 222, 222),
    backgroundColor: Color.fromARGB(255, 249, 249, 249),
    modalBackgroundColor: Color.fromARGB(255, 249, 249, 249),
    modalElevation: 0,
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    background: const Color.fromARGB(255, 249, 249, 249),
    primary: InternetBankingCores.azul_500,
  ),
  datePickerTheme: const DatePickerThemeData(
    headerBackgroundColor: InternetBankingCores.azul_500,
    headerForegroundColor: Colors.white,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.barlow(),
    bodyMedium: GoogleFonts.barlow(),
    bodyLarge: GoogleFonts.barlow(),
    displayLarge: GoogleFonts.barlow(),
    displayMedium: GoogleFonts.barlow(),
    displaySmall: GoogleFonts.barlow(),
    headlineLarge: GoogleFonts.barlow(),
    headlineMedium: GoogleFonts.barlow(),
    headlineSmall: GoogleFonts.barlow(),
    labelLarge: GoogleFonts.barlow(),
    labelMedium: GoogleFonts.barlow(),
    labelSmall: GoogleFonts.barlow(),
    titleLarge: GoogleFonts.barlow(),
    titleMedium: GoogleFonts.barlow(),
    titleSmall: GoogleFonts.barlow(),
  ),
);
