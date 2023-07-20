import 'package:contacts/call_screen.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const AboutScreen({Key? key, required this.name, required this.phoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AboutSectionHeader(name: name),
          AboutSectionBody(phoneNumber: phoneNumber),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallScreen(
                name: name,
                phoneNumber: phoneNumber,
              ),
            ),
          );
        },
        child: const Icon(Icons.call_rounded),
      ),
    );
  }
}

// About Section Body

class AboutSectionBody extends StatelessWidget {
  const AboutSectionBody({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.call_outlined, color: Colors.green),
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phoneNumber,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Text(
                        "Mobile",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.message_rounded, color: Colors.green)
            ],
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              const Icon(Icons.video_chat_rounded, color: Colors.green),
              const SizedBox(width: 30),
              Text(
                phoneNumber,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// About Section Header

class AboutSectionHeader extends StatelessWidget {
  const AboutSectionHeader({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1585854467604-cf2080ccef31?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80'))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.keyboard_arrow_left_rounded,
                    color: Colors.green, size: 35),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.star_border,
                        color: Colors.yellow, size: 25),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.edit, color: Colors.green, size: 25),
                  ),
                  const SizedBox(width: 10),
                  PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          value: "View linked contacts",
                          child: Text("View linked contacts"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Delete contact",
                          child: Text("Delete contact"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Share",
                          child: Text("Share"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Create shortcut",
                          child: Text("Create shortcut"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Enable audio call recording",
                          child: Text("Enable audio call recording"),
                        ),
                        const PopupMenuItem<String>(
                          value: "Set ringtone",
                          child: Text("Set ringtone"),
                        ),
                      ];
                    },
                  ),
                ],
              )
            ],
          ),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 80, color: Colors.blueGrey),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 35),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
