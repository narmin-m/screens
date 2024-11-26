import 'package:flutter/material.dart';
import 'ride_completed.dart'; // Ensure this import is correct

void main() {
  runApp(const SawaRideApp());
}

class SawaRideApp extends StatelessWidget {
  const SawaRideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SawaRideScreen(),
    );
  }
}

class SawaRideScreen extends StatelessWidget {
  const SawaRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Map
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/map_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo as a button
                GestureDetector(
                  onTap: () {
                    // Navigate to RideSummaryScreen when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RideSummaryScreen()),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'lib/assets/logo.png', // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Tagline
                const Text(
                  "Saudi Arabia's first ever\nOpen Mobility App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Footer
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  "Proudly",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Saudi Made logo
                    Image.asset(
                      'lib/assets/saudi_made.png', // Replace with your logo
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 16),
                    // Part of logo
                    Image.asset(
                      'lib/assets/part_of_logo.png', // Replace with your logo
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
