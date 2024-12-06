import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi, Ronald',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'UK',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // TODO: Implement notification functionality
            },
          ),
        ],
      ),
    );
  }
}
