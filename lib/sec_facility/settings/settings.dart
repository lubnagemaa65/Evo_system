import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  bool switch4 = false;
  bool switch5 = false;
  bool switch6 = false;

  void _checkNavigation() {
    if (switch1 && switch2) {
      Navigator.pushNamed(context, "/empty1");
    } else if (switch3 && switch4) {
      Navigator.pushNamed(context, "/empty2");
    } else if (switch5 && switch6) {
      Navigator.pushNamed(context, "/empty3");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 25),
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
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Icon(Icons.notifications, color: Colors.blue),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              "Factory",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Facility name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "  Factory",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  ),
                ),
                //const SizedBox(height: 10),
                buildSwitch("Fire system", switch1, (value) {
                  setState(() {
                    switch1 = value;
                    _checkNavigation();
                  });
                }),
                buildSwitch("Fire system Notifications", switch2, (value) {
                  setState(() {
                    switch2 = value;
                    _checkNavigation();
                  });
                }),
                buildDashedDivider(),
                buildSwitch("Protection system", switch3, (value) {
                  setState(() => switch3 = value);
                  _checkNavigation();
                }),
                buildSwitch("Protection system notification", switch4, (value) {
                  setState(() => switch4 = value);
                  _checkNavigation();
                }),
                buildDashedDivider(),
                buildSwitch("Energy saving system", switch5, (value) {
                  setState(() => switch5 = value);
                  _checkNavigation();
                }),
                buildSwitch("Energy saving system notification", switch6,
                    (value) {
                  setState(() => switch6 = value);
                  _checkNavigation();
                }),
                const SizedBox(height: 70),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Center(
                      child: Text("Save",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSwitch(String text, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600)),
        SizedBox(
          width: 100,
          child: Switch(
            value: value,
            onChanged: onChanged,
            inactiveThumbColor: Colors.green,
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildDashedDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(8, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 20,
            height: 3.5,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            color: Colors.grey,
          ),
        );
      }),
    );
  }
}
