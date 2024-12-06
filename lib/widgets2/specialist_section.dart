import 'package:flutter/material.dart';

class SpecialistSection extends StatelessWidget {
  const SpecialistSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialists = [
      {'icon': Icons.psychology, 'name': 'Neurologist'},
      {'icon': Icons.accessibility_new, 'name': 'Orthopedic'},
      {'icon': Icons.assignment, 'name': 'Test Report'},
      {'icon': Icons.assignment, 'name': 'Dentist'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Specialist',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement view all functionality
                },
                child: const Text('View all'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialists.length,
            itemBuilder: (context, index) {
              final specialist = specialists[index];
              return Container(
                width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue[50],
                      child: Icon(specialist['icon'] as IconData,
                          color: Colors.blue),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      specialist['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
