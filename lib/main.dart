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
    return const Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.green),
            title: Text('2800.00'),
            subtitle: Text('João Miguel Moscardini'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.green),
            title: Text('2800.00'),
            subtitle: Text('João Miguel Moscardini'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.green),
            title: Text('2800.00'),
            subtitle: Text('João Miguel Moscardini'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.green),
            title: Text('2800.00'),
            subtitle: Text('João Miguel Moscardini'),
          ),
        ),
      ],
    );
  }
}
