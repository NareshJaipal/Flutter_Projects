import 'package:contacts/about_screen.dart';
// import 'package:contacts/main.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();

  void updateTextFieldText(BuildContext context) {
    String updatedName = firstName.text + lastName.text;
    String updatedNumber = phoneNo.text;

    setState(() {
      contacts.add({'name': updatedName, 'phoneNumber': updatedNumber});
    });

    firstName.clear();
    lastName.clear();
    phoneNo.clear();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Contacts",
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        createNewAccount(context);
                      },
                      child: const Text("Add Contact"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[50],
                    hintText: 'Search name, number, etc',
                    hoverColor: Colors.lightBlueAccent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final sortedContacts = [...contacts];
                sortedContacts.sort((a, b) => a['name'].compareTo(b['name']));

                final contact = sortedContacts[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutScreen(
                                name: contact['name'],
                                phoneNumber: contact['phoneNumber'],
                              ),
                            ),
                          );
                        },
                        leading: const CircleAvatar(
                            backgroundColor: Colors.lightBlueAccent,
                            child: Icon(Icons.person)),
                        title: Text(contact['name']),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: const Divider(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> createNewAccount(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.all(5),
            height: 255,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.keyboard_arrow_left_rounded),
                    ),
                    const Text("Create a new contact"),
                  ],
                ),
                const Divider(),
                TextField(
                  controller: firstName,
                  decoration: const InputDecoration(label: Text("First name")),
                ),
                TextField(
                  controller: lastName,
                  decoration: const InputDecoration(label: Text("Last name")),
                ),
                TextField(
                  controller: phoneNo,
                  decoration: const InputDecoration(label: Text("Phone")),
                ),
                const SizedBox(height: 15),
                TextButton(
                  child: const Text("Save"),
                  onPressed: () => updateTextFieldText(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
