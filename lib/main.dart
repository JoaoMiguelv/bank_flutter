import 'dart:math';
import 'package:bank/route/app_routes.dart';
import 'package:bank/view/contact-form.dart';
import 'package:bank/view/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      BanckApp(),
    );

class BanckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      routes: {
        AppRoutes.HOME: (_) => Home(),
        AppRoutes.CONTACT_FORM: (_) => ContactForm(),
      },
      title: 'BankDSM',
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
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: Column(
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
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

//
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  String _formatarValor(double valor) {
    // Converte o valor para uma string com duas casas decimais
    String valorFormatado = valor.toStringAsFixed(2);

    // Substitui o ponto por vírgula para representar as casas decimais
    valorFormatado = valorFormatado.replaceAll('.', ',');

    // Adiciona o símbolo da moeda (R$) no início da string
    valorFormatado = 'R\$ ' + valorFormatado;

    return valorFormatado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey[400],
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          String valorFormatado = _formatarValor(transferencia.valor);
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.monetization_on,
                color: Colors.green,
              ),
              title: Text(valorFormatado),
              subtitle: Text(transferencia.numeroConta.toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('Chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.black,
        backgroundColor: Colors.green,
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
