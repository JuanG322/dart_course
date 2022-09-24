import 'package:flutter/material.dart';
//import 'pages/converter_page.dart';

import 'package:f_currency_converter_template/ui/widgets/selection_item.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // aquí agregamos el MaterialApp al árbol de widgets
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Currency converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // TODO
        // ConverterPage es el widget que presenta la página de la aplicación
        home: const ConverterPage());
  }
}

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  // el estado del widget
  int currency1 = 1;
  int currency2 = 0;

  // función para construir el selector de monedas
  List<Widget> _buildItems() {
    return currencies
        .map((val) => SelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DirectSelect(
                  itemExtent: 45.0,
                  selectedIndex: currency1,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      currency1 = index ?? 0;
                    });
                  },
                  items: _buildItems(),
                  child: SelectionItem(
                    isForList: false,
                    title: currencies[currency1],
                  ),
                ),
              ),
              Expanded(
                child: DirectSelect(
                  itemExtent: 45.0,
                  selectedIndex: currency1,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      currency1 = index ?? 0;
                    });
                  },
                  items: _buildItems(),
                  child: SelectionItem(
                    isForList: false,
                    title: currencies[currency1],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
