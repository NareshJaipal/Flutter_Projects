import 'package:contacts/about_screen.dart';
// import 'package:contacts/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> contacts = [
    {'name': 'Abdul Rehman Khan', 'phoneNumber': '+92 312 9052024'},
    {'name': 'Kabeer Oad', 'phoneNumber': '+92 301 3603209'},
    {'name': 'MeerKhan Rajput', 'phoneNumber': '+92 309 9034713'},
    {'name': 'Ali Mahdi', 'phoneNumber': '+92 316 1328519'},
  ];

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
      body: Column(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.search_outlined, color: Colors.teal),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings, color: Colors.teal),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = contacts[index];
                return Padding(
                  padding: const EdgeInsets.all(8),
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
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    title: Text(contact["name"]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
      ),
    );
  }
}
