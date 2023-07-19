import 'package:contacts/about_screen.dart';
// import 'package:contacts/main.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController searchBarController = TextEditingController();

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

  List<Map<String, dynamic>> foundContacts = [];
  @override
  void initState() {
    foundContacts = contacts;
    super.initState();
  }

  List<Map<String, dynamic>> searchResults = [];
  void searchContacts(String query) {
    if (query.isEmpty) {
      searchResults = contacts;
    } else {
      searchResults = contacts
          .where((contact) => contact['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      foundContacts = searchResults;
    });
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
                    const Text("Contacts", style: TextStyle(fontSize: 28)),
                    addContactButton(context),
                  ],
                ),
                const SizedBox(height: 15),
                searchBar(),
              ],
            ),
          ),
          Expanded(
            child: foundContacts.isNotEmpty
                ? ListView.builder(
                    itemCount: foundContacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final sortedContacts = [...foundContacts];
                      sortedContacts
                          .sort((a, b) => a['name'].compareTo(b['name']));

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
                  )
                : const Text("No contacts found"),
          ),
        ],
      ),
    );
  }

  TextButton addContactButton(BuildContext context) {
    return TextButton(
      child: const Text("Add Contact"),
      onPressed: () {
        showDialog(
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
                      decoration:
                          const InputDecoration(label: Text("First name")),
                    ),
                    TextField(
                      controller: lastName,
                      decoration:
                          const InputDecoration(label: Text("Last name")),
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
      },
    );
  }

  TextField searchBar() {
    return TextField(
      controller: searchBarController,
      onChanged: (value) {
        setState(() {
          searchContacts(value);
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[50],
        hintText: 'Search name, number, etc',
        suffixIcon: IconButton(
          color: Colors.red,
          onPressed: () {
            setState(() {
              searchBarController.clear();
            });
          },
          icon: const Icon(Icons.clear_rounded, size: 15),
        ),
        prefixIcon: const Icon(Icons.search_rounded),
        hoverColor: Colors.lightBlueAccent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
