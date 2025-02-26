import 'package:flutter/material.dart';

class RedeemDetailScreen extends StatefulWidget {
  @override
  _RedeemDetailScreenState createState() => _RedeemDetailScreenState();
}

class _RedeemDetailScreenState extends State<RedeemDetailScreen> {
  // State variable to track the spicy level
  double _spicyLevel = 0.3;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9F9B8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/allimages/ExtraBurger.png",
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Cheeseburger Wendy's Burger",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: 4),
                  Text(
                    "4.9",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "• 26 mins",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "The Cheeseburger Wendy's Burger is a classic fast food "
                    "burger that packs a punch of flavor in every bite. "
                    "Made with a juicy beef patty cooked to perfection, it's "
                    "topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),
              Text(
                "Spicy",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: _spicyLevel,
                onChanged: (value) {
                  setState(() {
                    _spicyLevel = value;
                  });
                },
                min: 0,
                max: 1,
                activeColor: Colors.green,
                inactiveColor: Colors.red,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mild", style: TextStyle(color: Colors.green)),
                  Text("Hot", style: TextStyle(color: Colors.red)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Portion",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_quantity > 1) {
                                _quantity--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove, color: Colors.black),
                          iconSize: 18,
                        ),
                        Text("$_quantity", style: TextStyle(fontSize: 16)),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.black),
                          iconSize: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                      ),
                      child: Text(
                        "150 Points",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 3,
                      ),
                      child: Text(
                        "Redeem Now",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 5,
        width: 100,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(2.5),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}