import 'package:flutter/material.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  final List<int> _selectedReasons = [0, 2]; // ✅ First (0) & Last (2) selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pushNamed(context, '/sec_fac');
          },
        ),
        title: const Text(
          'LOGO',
          style: TextStyle(
            fontSize: 36,
            fontFamily: 'Playfair Display',
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications, color: Colors.blue),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: const Text(
              "Factory",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
              color: Colors.blue.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Maintenance",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildCheckboxOption(0, "Fire system."),
                  buildCheckboxOption(1, "Energy saving system."),
                  buildCheckboxOption(2, "Protection system."),
                  const SizedBox(height: 20),
                  const Text(
                    "Couse of Maintenance:",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ✅ Moved the OK Button Inside the Blue Container
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sec_fac');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "OK",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  // ✅ Changed from Radio to Checkbox for multiple selection
  Widget buildCheckboxOption(int value, String text) {
    return Row(
      children: [
        Checkbox(
          value: _selectedReasons.contains(value),
          onChanged: (bool? checked) {
            setState(() {
              if (checked == true) {
                _selectedReasons.add(value);
              } else {
                _selectedReasons.remove(value);
              }
            });
          },
          activeColor: Colors.green,
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
