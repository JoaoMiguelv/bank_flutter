import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
          body: ListaTransferencias(),
          appBar: AppBar(
            title: const Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )),
    ));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      ItemTransferencia(Transferencia(100.00, 123456)),
      ItemTransferencia(Transferencia(200.00, 654321)),
      ItemTransferencia(Transferencia(300.00, 987654)),
    ]);
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
