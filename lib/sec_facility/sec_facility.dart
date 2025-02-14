import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecFacility extends StatefulWidget {
  const SecFacility({super.key});

  @override
  State<SecFacility> createState() => _SecFacilityState();
}

class _SecFacilityState extends State<SecFacility> {
  String selectedCam = "Cam1";
  final List<String> camOptions = ["Cam1", "Cam2", "Cam3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'LOGO',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playfair Display',
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
          actions: const [
            Icon(Icons.notifications, color: Colors.blue), // Alert icon
            SizedBox(width: 16),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Factory Title
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const Text(
              "Factory",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Blue Container Wrapping Everything
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildDropdown(),
                  const SizedBox(height: 20),
                  _buildLiveCam(),
                  const SizedBox(height: 20),
                  _buildTextColumn(),
                  const SizedBox(height: 20),

                  // Buttons at Bottom of Container
                  _buildBottomButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      value: selectedCam,
      items: camOptions
          .map((cam) => DropdownMenuItem(value: cam, child: Text(cam)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedCam = value!;
        });
      },
    );
  }

  Widget _buildLiveCam() {
    return Container(
      height: 178,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LIVE CAM",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(Icons.videocam_outlined, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTextColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Fire system ",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w600)),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Temperature",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 10,
            ),
            Text("37 C",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Smoke",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 60,
            ),
            Text("NO",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Horn",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 75,
            ),
            Text("YES",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
        Text("Energy saving system",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w600)),
        SizedBox(height: 6),
        Row(
          children: [
            Text("Status",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 75,
            ),
            Text("YES",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
        Text("Protection system",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w600)),
        Row(
          children: [
            Text("Movement",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
            SizedBox(
              width: 50,
            ),
            Text("YES",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton("Maintain", Colors.blue, "/maintain"),
        _buildButton("Settings", Colors.blue, "/settings"),
      ],
    );
  }

  Widget _buildButton(String text, Color color, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
