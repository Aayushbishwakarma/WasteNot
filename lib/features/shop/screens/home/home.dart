import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  // Image paths
  static const bottle = "assets/images/homescreen_images/Bottle.png";
  static const can = "assets/images/homescreen_images/Can.png";
  static const glass = "assets/images/homescreen_images/Glass.png";

  @override
  Widget build(BuildContext context) {
    // Decreased height for the deposit box
    double containerHeight = 160;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(color: Colors.blue),
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.2,
                          child: Icon(Iconsax.coin, size: 100, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Greeting\n",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "User!!!",
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(Iconsax.notification, color: Colors.white),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(Iconsax.search_normal, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Search "Payments"',
                                    style: GoogleFonts.poppins(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.white),
                ),
              ],
            ),

            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 0,
              right: 0,
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),

            Positioned(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).size.height / 2 - (containerHeight / 2),
              child: Container(
                height: containerHeight,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Total Deposit",
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _depositItem(bottle, "Plastic", "3"),
                        Container(height: 50, width: 1, color: Colors.grey),
                        _depositItem(can, "Aluminum Can", "5"),
                        Container(height: 50, width: 1, color: Colors.grey),
                        _depositItem(glass, "Glass", "9"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _depositItem(String imagePath, String label, String count) {
    return Column(
      children: [
        Image.asset(imagePath, width: 40, height: 40),
        SizedBox(height: 5),
        Text(label, style: GoogleFonts.poppins(fontSize: 12)),
        SizedBox(height: 5),
        Text(count, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
