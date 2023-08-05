import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'database.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> favoriteContacts =
      contacts.where((contact) => contact['isFavorite'] == true).toList();

  void updateFavoriteStatus(String name, bool isFavorite) {
    setState(() {
      final contact = favoriteContacts.firstWhere(
        (contact) => contact['name'] == name,
        orElse: () => {},
      );
      if (contact.isNotEmpty) {
        contact['isFavorite'] = isFavorite;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteContacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = favoriteContacts[index];
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
                                isFavorite: contact['isFavorite'],
                                photo: contact['photo'],
                                call: contact['call'],
                                time: contact['time'],
                              ),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlueAccent,
                          backgroundImage: AssetImage(contact['photo']),
                        ),
                        title: Text(favoriteContacts[index]['name']),
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
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Favorite", style: TextStyle(fontSize: 28)),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
