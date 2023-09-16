import 'package:flutter/material.dart';

void main() => runApp(
      BankApp(),
    );

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FomularioTransferencia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FomularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.monetization_on,
                  color: Colors.green,
                ),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int numeroConta =
                  int.parse(_controladorCampoNumeroConta.text);
              final double valor = double.parse(_controladorCampoValor.text);

              Transferencia(valor, numeroConta);
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        body: Column(
          children: [
            ItemTransferencia(Transferencia(546.20, 1000)),
            ItemTransferencia(Transferencia(7895.10, 2000)),
            ItemTransferencia(Transferencia(54890.30, 3000)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.green),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
