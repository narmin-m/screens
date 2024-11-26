import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:get/get.dart';

void main() {
  runApp(const RideCompletedApp());
}

class RideCompletedController extends GetxController {
  var driverName = 'Abdullah Alshammari'.obs;
  var fareAmount = 50.obs;
}

class RideCompletedApp extends StatelessWidget {
  const RideCompletedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      home: const RideCompletedScreen(),
    );
  }
}

class RideCompletedScreen extends StatelessWidget {
  const RideCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RideCompletedController());

    return Scaffold(
      body: Stack(
        children: [
          // Background content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Image(
                  image: AssetImage('lib/assets/arab_image.png'),
                  height: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Obx(() => Text(
                      'Ride completed with\n${controller.driverName.value}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Pay Driver Using Cash / ',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Image.asset('lib/assets/stc_pay.png', height: 20),
                    const Text(' / ', style: TextStyle(color: Colors.grey)),
                    Image.asset('lib/assets/urpay.png', height: 30),
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'lib/assets/map_image.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ).blurred(
            blur: 8,
            colorOpacity: 0.1,
          ),

          // Rating card
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green, width: 1.5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Skip Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle skip action
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Driver Image
                  const Image(
                    image: AssetImage('lib/assets/arab_image.png'),
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  // Ride Details
                  const Text(
                    'Wednesday, 26/05 16:20',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Obx(() => Text(
                        'How was your experience with\n${controller.driverName.value}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )),
                  const SizedBox(height: 10),
                  // Rating Stars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star_border,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Payment Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            '${controller.fareAmount.value} SAR',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                      const Text(
                        'CASH',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 12),
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
          ),
        ],
      ),
    );
  }
}
