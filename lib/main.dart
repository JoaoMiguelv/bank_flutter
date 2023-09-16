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
          Editor(
              _controladorCampoNumeroConta,
              'Número Conta',
              '0000',
              const Icon(
                Icons.account_balance,
                color: Colors.blue,
              )),
          Editor(
              _controladorCampoValor,
              'Valor',
              '0.00',
              const Icon(
                Icons.monetization_on,
                color: Colors.green,
              )),
          ElevatedButton(
            onPressed: () {
              // ignore: unnecessary_null_comparison
              if (_controladorCampoNumeroConta.text != '' ||
                  // ignore: unnecessary_null_comparison
                  _controladorCampoValor.text != '') {
                final int numeroConta =
                    int.parse(_controladorCampoNumeroConta.text);
                final double valor = double.parse(_controladorCampoValor.text);
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint(transferenciaCriada.toString());
              } else {
                debugPrint('Campos vazios');
              }
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final Icon _icone;

  Editor(this._controlador, this._rotulo, this._dica, this._icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _controlador,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: _icone,
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
