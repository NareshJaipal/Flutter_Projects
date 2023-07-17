// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   final List<Contact> contacts = [
//     Contact(name: 'John Doe', phoneNumber: '123-456-7890'),
//     Contact(name: 'Jane Smith', phoneNumber: '987-654-3210'),
//     // Add more contacts as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Contacts App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ContactListScreen(contacts: contacts),
//     );
//   }
// }

// class ContactListScreen extends StatefulWidget {
//   final List<Contact> contacts;

//   const ContactListScreen({required this.contacts});

//   @override
//   _ContactListScreenState createState() => _ContactListScreenState();
// }

// class _ContactListScreenState extends State<ContactListScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _phoneNumber = '';

//   void _addContact() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       final newContact = Contact(name: _name, phoneNumber: _phoneNumber);
//       setState(() {
//         widget.contacts.add(newContact);
//       });
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contacts'),
//       ),
//       body: ListView.builder(
//         itemCount: widget.contacts.length,
//         itemBuilder: (BuildContext context, int index) {
//           final contact = widget.contacts[index];
//           return ListTile(
//             title: Text(contact.name),
//             subtitle: Text(contact.phoneNumber),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Add Contact'),
//                 content: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(labelText: 'Name'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter a name.';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           _name = value!;
//                         },
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(labelText: 'Phone Number'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter a phone number.';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           _phoneNumber = value!;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: _addContact,
//                     child: Text('Add'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Cancel'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class Contact {
//   final String name;
//   final String phoneNumber;

//   Contact({required this.name, required this.phoneNumber});
// }
