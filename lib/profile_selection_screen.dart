import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileSelectionScreen extends StatelessWidget {
  final Map<String, dynamic> userInfo;
  const ProfileSelectionScreen({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> profiles = [
      {'name': 'Ger', 'imagePath': 'assets/images/profile1.png'},
      {'name': 'Didi', 'imagePath': 'assets/images/profile2.png'},
      {'name': 'Adri', 'imagePath': 'assets/images/profile3.png'},
      {'name': 'Todos', 'imagePath': 'assets/images/profile4.png'},
    ];

    final String username = userInfo['username'];
    final int activeConnections = userInfo['active_cons'];
    final int maxConnections = userInfo['max_connections'];

    final String expDateString = userInfo['exp_date'].toString();
    final int expDateTimestamp = int.parse(expDateString);

    final DateTime expirationDate = DateTime.fromMillisecondsSinceEpoch(expDateTimestamp * 1000);
    final String formattedDate = DateFormat('dd/MM/yyyy').format(expirationDate);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.webp',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO ADDED HERE
                Image.asset(
                  'assets/images/logo.png',
                  width: 200.0,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '¿Quién está viendo?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0, // Reduced font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: 350.0, // Increased width
                  height: 350.0, // Increased height
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 2.0, // Increased vertical spacing
                    children: profiles.map((profile) {
                      return _buildProfile(context, profile['name']!, profile['imagePath']!);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 50.0),
                // Service Info
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Usuario: $username',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Dispositivos: $activeConnections/$maxConnections',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Vence: $formattedDate',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context, String name, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // TODO: Navigation logic to the next screen
            print('Perfil de $name seleccionado.');
          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}