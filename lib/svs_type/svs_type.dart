import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SVSScreen extends StatelessWidget {
  const SVSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'LOGO',
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'Playfair Display',
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCard(FontAwesomeIcons.fire, 'Fire System',
                'a smoke and temperature Sensors that detect smoke\n and Gaz values or any increase in temperature'),
            _buildCard(FontAwesomeIcons.camera, 'Protection system',
                'camera that detect known and\n unknown persones in scheduled times'),
            _buildCard(FontAwesomeIcons.batteryFull, 'Energy saving system',
                'camera detect motion and turn\n ONOFF the lights system'),
            const SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sub_form');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Keep rounded corners
        border: Border.all(color: Colors.black, width: 1), // Thin black border
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // Optional: adds a subtle shadow
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
