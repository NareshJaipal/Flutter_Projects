import 'package:flutter/material.dart';
import 'database.dart';

class RecentCallScreen extends StatefulWidget {
  // final String formatedTime;
  const RecentCallScreen({super.key});

  @override
  State<RecentCallScreen> createState() => _RecentCallScreenState();
}

class _RecentCallScreenState extends State<RecentCallScreen> {
  List<Map<String, dynamic>> recentCalls =
      contacts.where((contact) => contact['call'] == true).toList();

  void updateFavoriteStatus(String name, bool call) {
    setState(() {
      final contact = recentCalls.firstWhere(
        (contact) => contact['name'] == name,
        orElse: () => {},
      );
      if (contact.isNotEmpty) {
        contact['call'] = call;
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
            child: recentCalls.isNotEmpty
                ? ListView.builder(
                    itemCount: recentCalls.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = recentCalls[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: ListTile(
                              onTap: () {},
                              leading: CircleAvatar(
                                backgroundColor: Colors.lightBlueAccent,
                                backgroundImage: AssetImage(contact['photo']),
                              ),
                              title: Text(recentCalls[index]['name']),
                              subtitle: Row(
                                children: [
                                  Transform.rotate(
                                    angle: 90,
                                    child: const Icon(
                                      Icons.arrow_back_rounded,
                                      size: 18,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text('Pakistan')
                                ],
                              ),
                              trailing: Text(
                                recentCalls[index]['time'],
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
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
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timelapse_rounded,
                          size: 70,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Your call history is empty',
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'No Call History',
                          style: TextStyle(fontSize: 36),
                        ),
                      ],
                    ),
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
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recents", style: TextStyle(fontSize: 28)),
            ],
          ),
        ],
      ),
    );
  }
}
