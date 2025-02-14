import 'package:flutter/material.dart';
import 'package:factory_task/home/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Switch states
  bool isHomeOn = false;
  bool isFactoryOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign GlobalKey to Scaffold
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.blue), // Blue Drawer Icon
          onPressed: () {
            _scaffoldKey.currentState
                ?.openDrawer(); // Opens the drawer correctly
          },
        ),
        title: Transform.translate(
          offset: Offset(0, 10),
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
          Icon(Icons.notifications, color: Colors.blue), // Alert icon
          SizedBox(width: 16),
        ],
      ),
      drawer: const DrawerPage(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              'User Name',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.blue.shade50, // Light blue background

              child: ListView(
                children: [
                  _buildCard(
                    title: "My Home",
                    description: "Fire system\nPower saver system",
                    imageUrl: "https://via.placeholder.com/60",
                    isOn: isHomeOn,
                    onToggle: (value) {
                      setState(() {
                        isHomeOn = value;
                        Navigator.pushNamed(context, '/sec_fac');
                      });
                    },
                  ),
                  _buildCard(
                    title: "Factory",
                    description:
                        "Fire system\nPower saver system\nProtection system",
                    imageUrl: "https://via.placeholder.com/60",
                    isOn: isFactoryOn,
                    onToggle: (value) {
                      setState(() {
                        isFactoryOn = value;
                        Navigator.pushNamed(context, '/sec_fac');
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required String imageUrl,
    required bool isOn,
    required Function(bool) onToggle,
  }) {
    return SizedBox(
      height: 160,
      child: Card(
        color: Colors.lightBlue.shade100, // Light blue background
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Image Box
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Text & Check Icons Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: description
                          .split("\n")
                          .map(
                            (item) => Row(
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.blue,
                                    size: 18), // Blue Check Icon
                                const SizedBox(width: 8),
                                Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              // Switch
              Switch(
                value: isOn,
                onChanged: onToggle,
                activeColor: Colors.green, // Green when ON
                inactiveThumbColor: Colors.red,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white, // Red when OFF
              ),
            ],
          ),
        ),
      ),
    );
  }
}
