import 'dart:async';
import 'dart:ui';
import 'package:authentication/features/shop/screens/voucher/redeem_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  final int userPoints = 500;
  late final PageController _pageController;
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  Timer? _autoPlayTimer;

  // Updated carousel images to use Voucher_images folder
  final List<Map<String, dynamic>> carouselItems = [
    {"name": "Burger", "subtext": "Delicious Burger", "rating": 4.7, "points": 200, "image": "assets/images/allimages/Burger.jpg"},
    {"name": "Pizza", "subtext": "Cheesy Pizza", "rating": 4.8, "points": 300, "image": "assets/images/allimages/Pizza.jpeg"},
    {"name": "Coffee", "subtext": "Hot Coffee", "rating": 4.6, "points": 150, "image": "assets/images/allimages/Coffee.jpeg"},
    {"name": "French Fries", "subtext": "Crispy Fries", "rating": 4.5, "points": 250, "image": "assets/images/allimages/French Fries.jpg"},
  ];

  // Keeping the original food items for the redeem section
  final List<Map<String, dynamic>> foodItems = [
    {"name": "Burger", "subtext": "Delicious Burger", "rating": 4.7, "points": 200, "image": "assets/images/Voucher_images/Burger.png"},
    {"name": "Pizza", "subtext": "Cheesy Pizza", "rating": 4.8, "points": 300, "image": "assets/images/Voucher_images/Pizza.png"},
    {"name": "Coffee", "subtext": "Hot Coffee", "rating": 4.6, "points": 150, "image": "assets/images/Voucher_images/Coffee.png"},
    {"name": "French Fries", "subtext": "Crispy Fries", "rating": 4.5, "points": 250, "image": "assets/images/allimages/French Fries.jpg"},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75);
    _pageController.addListener(_pageListener);
    _startAutoPlay();
  }

  void _pageListener() {
    _currentIndex.value = _pageController.page!.round();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex.value + 1) % carouselItems.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    _autoPlayTimer?.cancel();
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9F9B8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 10),
                _buildSearchBar(),
                const SizedBox(height: 20),
                _buildPointsCard(),
                const SizedBox(height: 20),
                _buildCarouselSection(),
                const SizedBox(height: 20),
                _buildFoodGridNonScrollable(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "EcoBite",
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Turn Every Bite Into Green",
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search your foods...",
        hintStyle: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        prefixIcon: const Icon(Iconsax.search_normal, color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
            "Your Points: $userPoints",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Icon(Iconsax.shopping_bag, size: 30, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildCarouselSection() {
    return SizedBox(
      height: 200,
      child: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, currentIndex, _) {
          return PageView.builder(
            controller: _pageController,
            itemCount: carouselItems.length,
            itemBuilder: (context, index) {
              return _buildCarouselItem(index, currentIndex);
            },
          );
        },
      ),
    );
  }

  Widget _buildCarouselItem(int index, int currentIndex) {
    bool isCenter = index == currentIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              carouselItems[index]["image"],
              fit: BoxFit.cover,
            ),
            if (!isCenter)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodGridNonScrollable() {
    return GridView.builder(
      itemCount: foodItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return _buildFoodCard(foodItems[index]);
      },
    );
  }

  Widget _buildFoodCard(Map<String, dynamic> item) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item["image"],
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item["name"],
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            "${item["points"]} Points",
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          // New Row for Rating and Favorite Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item["rating"].toString(),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width:2),
              Icon(
                Iconsax.star1, // Use the star icon for rating
                size: 16,
                color: Colors.amber,
              ),
              const SizedBox(width: 100),
              Icon(
                Iconsax.heart, // Use the heart icon for favorite
                size: 16,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Get.to(RedeemDetailScreen()),
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
    );
  }
}