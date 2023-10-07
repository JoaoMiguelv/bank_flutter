import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      BanckApp(),
    );

class BanckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criando Transferência',
        ),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controladorCampoNumeroConta,
            icon: Icon(
              Icons.account_balance_outlined,
              color: Colors.blue,
            ),
            rotulo: 'Numero da conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            icon: Icon(
              Icons.monetization_on,
              color: Colors.green,
            ),
            rotulo: 'Valor',
            dica: '0.00',
          ),
          ElevatedButton(
            child: Text('Conrfirmar'),
            onPressed: () {
              _criaTransferencia(
                context,
                _controladorCampoNumeroConta,
                _controladorCampoValor,
              );
            },
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(
    BuildContext context,
    _controladorCampoNumeroConta,
    _controladorCampoValor,
  ) {
    debugPrint('clicou no confirmar');
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

//
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then(
            (tranferenciaRecebida) {
              debugPrint('chegou no then');
              debugPrint('$tranferenciaRecebida');

              if (tranferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(tranferenciaRecebida);
                });
              }
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
          color: Colors.green,
        ),
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
    return 'Transferencia{Valor: $valor, Numero da Conta: $numeroConta}';
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final Icon? icon;
  final String? rotulo;
  final String? dica;

  Editor({this.controlador, this.icon, this.rotulo, this.dica});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
