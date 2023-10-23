import 'package:bank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'João',
                  ),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['name'] = value;
                    }
                  },
                  // Validator e outros atributos
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    hintText: '(99) 99999-9999',
                  ),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['phone'] = value;
                    }
                  },
                  // Validator e outros atributos
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    hintText: 'Rua das Flores, 123',
                  ),
                  onSaved: (value) => _formData['address'] = value ?? '',
                  // Validator e outros atributos
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'joao@mail.com',
                  ),
                  onSaved: (value) => _formData['email'] = value ?? '',
                  // Validator e outros atributos
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    hintText: '155.456.284-55',
                  ),
                  onSaved: (value) => _formData['cpf'] = value ?? '',
                  // Validator e outros atributos
                ),
                ElevatedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    _saveForm();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final contact = Contact(
        _formData['name']!,
        _formData['address']!,
        _formData['phone']!,
        _formData['email']!,
        _formData['cpf']!,
      );
      print(contact);
      Navigator.pop(context, contact);
    }
  }
}
