import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EcommerceScreen extends StatelessWidget {
  static const String beauty = "assets/images/allimages/beauty.jpg";
  static const String fashion = "assets/images/allimages/fashion.jpg";
  static const String kids = "assets/images/allimages/kids clothing.jpg";
  static const String mens = "assets/images/allimages/mens clothing .jpg";
  static const String printed_kurta = "assets/images/ecommerce_images/kurta.png";
  static const String shoes = "assets/images/ecommerce_images/shoes.png";
  static const String shopnow = "assets/images/allimages/shop now.jpg";
  static const String womens = "assets/images/allimages/womens.jpg";

  const EcommerceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9F9B8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title:  Column(
          children: [
            Text(
              "E-Commerce",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Turn Waste Into Best",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        actions: [
          const Icon(Iconsax.profile_circle, size: 30, color: Colors.black),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Space between AppBar and points
              _buildMyPointsSection(),
              const SizedBox(height: 20), // Space between points and search bar
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategorySection(),
              const SizedBox(height: 20),
              _buildPromoBanner(context),
              const SizedBox(height: 25),
              _buildDealOfTheDay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyPointsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade700, Colors.green.shade400],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Points: 500",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Icon(Iconsax.shopping_bag, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search any product...",
        hintStyle: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        prefixIcon: const Icon(Iconsax.search_normal, color: Colors.black54),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    List<Map<String, String>> categories = [
      {"name": "Beauty", "image": beauty},
      {"name": "Fashion", "image": fashion},
      {"name": "Kids", "image": kids},
      {"name": "Mens", "image": mens},
      {"name": "Womens", "image": womens},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(category["image"]!),
                  radius: 30,
                ),
                const SizedBox(height: 5),
                Text(
                  category["name"]!,
                  style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(shopnow),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "50-40% OFF",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "Now in all product \nAll colours",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Navigating to Shop Page")),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.green, // Solid green button
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "🛒 Shop Now →",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDealOfTheDay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: _buildDealCard(printed_kurta, "Women Printed Kurta", 4.5, "1000 Points"),
              ),
            ),
            const SizedBox(width: 5), // Space between the cards
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _buildDealCard(shoes, "HRX by Hrithik Roshan", 4.2, "1200 Points"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDealCard(String image, String title, double rating, String points) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 100, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(title, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 15),
                Text(
                  points,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    elevation: 5,
                  ),
                  child: Text("Redeem", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
