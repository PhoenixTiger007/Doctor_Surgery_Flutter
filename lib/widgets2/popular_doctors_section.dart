import 'package:flutter/material.dart';
import '/screens/doctor_detail_screen.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        'name': 'Dr. Ronald richards',
        'specialty': 'Orthopedic',
        'rating': 5.0,
        'reviewCount': 123,
        'about':
            'Dr. Ronald richards is a highly skilled orthopedic surgeon with over 15 years of experience. He specializes in joint replacement and sports medicine.',
        'workingHours': 'Mon-Fri, 9:00 AM - 5:00 PM',
        'image': 'assets/images/populer_doctor_2nd.png',
      },
      {
        'name': 'Dr. Jenny wilson',
        'specialty': 'Nephrology',
        'rating': 4.9,
        'reviewCount': 98,
        'about':
            'Dr. Jenny wilson is a renowned nephrologist with expertise in kidney diseases and transplantation. She has been practicing for over a decade.',
        'workingHours': 'Mon-Sat, 10:00 AM - 6:00 PM',
        'image': 'assets/images/populer_doctor_3rd.png',
      },
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
                'Popular doctors',
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(doctor['image'] as String),
              ),
              title: Text(doctor['name'] as String),
              subtitle: Text(doctor['specialty'] as String),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  Text(doctor['rating'].toString()),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDetailsScreen(doctor: doctor),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
