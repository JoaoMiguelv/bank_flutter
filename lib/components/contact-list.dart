import 'package:bank/models/contact.dart';
import 'package:bank/view/contact-form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      _contacts.add(contact);
    });
  }

  void _deleteContact(Contact contact) {
    setState(() {
      _contacts.remove(contact);
    });
  }

  void _navigateToContactForm() async {
    final contactResult = await Navigator.push<Contact?>(
      context,
      MaterialPageRoute(builder: (context) => ContactForm()),
    );

    if (contactResult != null) {
      _addContact(contactResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _navigateToContactForm,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _contacts.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[300],
          thickness: 1,
          height: 1,
        ),
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(contact.name[0]),
            ),
            title: Text("Nome: ${contact.name}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Telefone: ${contact.phone}"),
                Text("Email: ${contact.email}"),
                Text("Endereço: ${contact.address}"),
                Text("CPF: ${contact.cpf}"),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteContact(contact),
            ),
          );
        },
      ),
    );
  }
}
