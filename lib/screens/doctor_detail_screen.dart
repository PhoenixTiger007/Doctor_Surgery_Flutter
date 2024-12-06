import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorDetailsScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[300], // A light grey color as a placeholder
              child: Icon(
                Icons.image, // A generic image icon
                size: 50,
                color: Colors.grey[700],
              ),
            ),
            // Image.asset(
            //   'assets/doctor_placeholder.png',
            //   width: double.infinity,
            //   height: 200,
            //   fit: BoxFit.cover,
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor['name'],
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    doctor['specialty'],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700]),
                      const SizedBox(width: 8),
                      Text(
                        '${doctor['rating']} (${doctor['reviewCount']} reviews)',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    doctor['about'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Working Hours',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    doctor['workingHours'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement booking functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Booking functionality coming soon!')),
                      );
                    },
                    child: const Text('Book Appointment'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
