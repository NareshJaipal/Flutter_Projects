import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;
  const CallScreen({Key? key, required this.name, required this.phoneNumber})
      : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.pexels.com/photos/1156684/pexels-photo-1156684.jpeg?cs=srgb&dl=pexels-arun-thomas-1156684.jpg&fm=jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CallScreenHeader(
              name: widget.name,
              phoneNumber: widget.phoneNumber,
            ),
            Container(
              margin: const EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.dialpad_rounded,
                        color: Colors.white, size: 40),
                  ),
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.red,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.call_end_rounded,
                          color: Colors.white, size: 28),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_down_sharp,
                        color: Colors.white, size: 40),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallScreenHeader extends StatelessWidget {
  const CallScreenHeader({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 80, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 35, color: Colors.white),
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                phoneNumber,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
              const SizedBox(width: 10),
              const Text(
                "Pakistan",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 3),
          const Text(
            "calling...",
            style: TextStyle(fontSize: 15, color: Colors.white),
          )
        ],
      ),
    );
  }
}
