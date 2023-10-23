import 'package:bank/components/contact-list.dart';
import 'package:bank/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ContactList();
                  }),
                );
              },
              child: Container(
                height: 150, // Altura do botão
                decoration: BoxDecoration(
                  color: Colors.blue, // Cor de fundo do botão
                  borderRadius: BorderRadius.circular(20), // Borda arredondada
                ),
                child: Center(
                  child: Text(
                    'Contatos',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ListaTransferencias();
                  }),
                );
              },
              child: Container(
                height: 150, // Altura do botão
                decoration: BoxDecoration(
                  color: Colors.blue, // Cor de fundo do botão
                  borderRadius: BorderRadius.circular(20), // Borda arredondada
                ),
                child: Center(
                  child: Text(
                    'Transferências',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
