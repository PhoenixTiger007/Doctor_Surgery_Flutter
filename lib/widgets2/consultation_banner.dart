import 'package:flutter/material.dart';

class ConsultationBanner extends StatelessWidget {
  const ConsultationBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Live consultation easily with top doctors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement booking functionality
                  },
                  child: const Text('Book Now'),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/available_doctor_1st.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
