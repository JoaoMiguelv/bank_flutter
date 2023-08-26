import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
          body: const Card(
            child: Text('Teste'),
          ),
          appBar: AppBar(
            title: const Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )),
    ));
