import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String photo;
  const CallScreen({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.photo,
  }) : super(key: key);

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
              photo: widget.photo,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
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
  final String name;
  final String phoneNumber;
  final String photo;
  const CallScreenHeader({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                width: 5,
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueGrey,
              backgroundImage: AssetImage(photo),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 23, color: Colors.white),
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
