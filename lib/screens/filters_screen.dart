import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/filters.dart';

class FiltersScreen extends StatefulWidget {
  final Filters filters;
  final Function(Filters) onFiltersChanged;

  const FiltersScreen(this.filters, this.onFiltersChanged, {Key? key})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
                _createSwitch(
                  'ABRIL',
                  'Desejo — Sexo — Casamento — Paixão',
                  filters!.isApril,
                  (value) => setState(() => filters!.isApril = value),
                ),
                _createSwitch(
                  'MAIO',
                  'Inteligência — Sentimentos — Palavras — Condicionamento',
                  filters!.isMay,
                  (value) => setState(() => filters!.isMay = value),
                ),
                _createSwitch(
                  'JUNHO',
                  'Energia — Atenção — Atenção Sem Escolha — Violência',
                  filters!.isJune,
                  (value) => setState(() => filters!.isJune = value),
                ),
                _createSwitch(
                  'JULHO',
                  'Felicidade — Mágoa — Dor — Tristeza',
                  filters!.isJuly,
                  (value) => setState(() => filters!.isJuly = value),
                ),
                _createSwitch(
                  'AGOSTO',
                  'Verdade — Realidade — O Observador e o Que É Observado — O Que É',
                  filters!.isAugust,
                  (value) => setState(() => filters!.isAugust = value),
                ),
                _createSwitch(
                  'SETEMBRO',
                  'Intelecto — Pensamento — Conhecimento — Mente',
                  filters!.isSeptember,
                  (value) => setState(() => filters!.isSeptember = value),
                ),
                _createSwitch(
                  'OUTUBRO',
                  'Tempo — Percepção — Cérebro — Transformação',
                  filters!.isOctober,
                  (value) => setState(() => filters!.isOctober = value),
                ),
                _createSwitch(
                  'NOVEMBRO',
                  'Viver — Morrer — Renascimento — Amor',
                  filters!.isNovember,
                  (value) => setState(() => filters!.isNovember = value),
                ),
                _createSwitch(
                  'DEZEMBRO',
                  'Estar Só — Religião — Deus — Meditação',
                  filters!.isDecember,
                  (value) => setState(() => filters!.isDecember = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
