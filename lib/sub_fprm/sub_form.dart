import 'package:flutter/material.dart';

class SubForm extends StatelessWidget {
  const SubForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")), // Optional AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  'LOGO',
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: 'Playfair Display',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField(
                  label: "Full Name", keyboardType: TextInputType.name),
              _buildInputField(
                label: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
              _buildInputField(
                  label: "Facility Number", keyboardType: TextInputType.number),
              _buildInputField(
                  label: "Facility Name", keyboardType: TextInputType.text),
              _buildInputField(
                  label: "Service Type", keyboardType: TextInputType.text),
              _buildInputField(
                  label: "Location", keyboardType: TextInputType.text),
              _buildInputField(
                  label: "Facility Name", keyboardType: TextInputType.text),
              _buildInputField(
                  label: "Service Type", keyboardType: TextInputType.text),
              _buildInputField(
                  label: "Location", keyboardType: TextInputType.text),
              const SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 70),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text("Submit",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30), // Extra space at bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextInputType keyboardType,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
