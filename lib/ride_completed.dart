import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ride_completed_rating.dart';

void main() {
  runApp(const RideSummaryApp());
}

class RideSummaryController extends GetxController {
  var driverName = 'Abdullah Alshammari'.obs;
  var fareAmount = 50.obs;
  var startLocation = 'EKDA6660, Al Khobar, Al Bandariyah'.obs;
  var endLocation =
      'Retail Square, King Faisal Ibn Abd Al Aziz, Al Bandariyah.'.obs;
}

class RideSummaryApp extends StatelessWidget {
  const RideSummaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      home: const RideSummaryScreen(),
    );
  }
}

class RideSummaryScreen extends StatelessWidget {
  const RideSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RideSummaryController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Driver Image
              const Image(
                image: AssetImage('lib/assets/arab_image.png'),
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // Ride Completion Text
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

              // Payment Methods
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Pay Driver Using Cash / ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/stc_pay.png',
                        height: 20,
                      ),
                      const Text(
                        ' / ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Image.asset(
                        'lib/assets/urpay.png',
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Fare Amount (Clickable to Navigate to Rate Driver Screen)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RideCompletedScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/rupee_icon.png',
                        height: 28,
                      ),
                      const SizedBox(width: 5),
                      Obx(() => Text(
                            '${controller.fareAmount.value} SAR',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              const Divider(),
              const SizedBox(height: 10),

              // Ride Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wednesday, 26/05 16:20',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 5),
                          Image.asset(
                            'lib/assets/arrow.png',
                            height: 50,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Obx(() => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.startLocation.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.endLocation.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Map Image
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
        ),
      ),
    );
  }
}
