import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/filters.dart';

class SettingsScreen extends StatefulWidget {
  final Filters filters;
  final Function(Filters) onFiltersChanged;

  const SettingsScreen(this.filters, this.onFiltersChanged, {Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Filters? filters;

  @override
  void initState() {
    super.initState();
    filters = widget.filters;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey,
      onChanged: (value) {
        onChanged(value);
        widget.onFiltersChanged(filters!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filtro por Mês',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'JANEIRO',
                  'Ouvir — Aprender — Autoridade — Autoconhecimento',
                  filters!.isJanuary,
                  (value) => setState(() => filters!.isJanuary = value),
                ),
                _createSwitch(
                  'FEVEREIRO',
                  'Vir a Ser — Crença — Acção — Bem e Mal',
                  filters!.isFebruary,
                  (value) => setState(() => filters!.isFebruary = value),
                ),
                _createSwitch(
                  'MARÇO',
                  'Dependência — Apego — Relacionamento — Medo',
                  filters!.isMarch,
                  (value) => setState(() => filters!.isMarch = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
