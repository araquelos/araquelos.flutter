import 'package:flutter/material.dart';

import '../componentes/grid_menu_consultas.dart';
import '../componentes/grid_menu_pagamentos.dart';
import '../componentes/grid_menu_pix.dart';
import '../componentes/grid_menu_transferencias.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: const <Widget>[
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    "Consultas",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 33, 98),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          GridMenuConsultas(),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    "Transferências",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 33, 98),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          GridMenuTransferencias(),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    "Pagamentos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 33, 98),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          GridMenuPagamentos(),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Text(
                    "PIX",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 11, 33, 98),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          GridMenuPix(),
        ],
      ),
    );
  }
}
