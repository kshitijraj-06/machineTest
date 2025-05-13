import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  // Dummy data for demonstration. Replace with your API data.
  final List<String> banners = [
    'http://devapiv4.dealsdray.com/icons/banner.png',
    'http://devapiv4.dealsdray.com/icons/discount_banner.png',
    'http://devapiv4.dealsdray.com/icons/Image -97.png',
  ];

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.phone_android, 'label': 'Mobile'},
    {'icon': Icons.laptop, 'label': 'Laptop'},
    {'icon': Icons.camera_alt, 'label': 'Camera'},
    {'icon': Icons.lightbulb_outline, 'label': 'LED'},
  ];
  final products = [
    {
      "icon": "http://devapiv4.dealsdray.com/icons/Image -70.png",
      "offer": "32%",
      "label": "Nokia 8.1(iron,64 GB)",
      "SubLabel": "",
    },
    {
      "icon": "http://devapiv4.dealsdray.com/icons/Image 7.png",
      "offer": "14%",
      "label": "Redmin Note 7s (Sapphire Blue 64 GB)",
      "SubLabel": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            // Search bar and icons
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Icon(Icons.notifications_none, size: 28),
                ],
              ),
            ),
            // Banner carousel (dummy static images)
            ImageSlideshow(
              width: double.infinity,
              initialPage: 0,
              height: 200,
              isLoop: true,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              autoPlayInterval: 3000,
              children: [
                Image.network('http://devapiv4.dealsdray.com/icons/banner.png'),
                Image.network(
                  'http://devapiv4.dealsdray.com/icons/discount_banner.png',
                ),
                Image.network(
                  'http://devapiv4.dealsdray.com/icons/Image -97.png',
                ),
              ],
            ),
            SizedBox(height: 16),
            // KYC Pending Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8EA7FF), // Start color (top left)
                      Color(0xFF5C6BC0), // End color (bottom right)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'KYC Pending',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You need to provide the required\ndocuments for your account activation.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha:0.93),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        // Handle KYC click
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha:0.18),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Click Here',
                          style: TextStyle(
                            color: Colors.yellowAccent.shade100,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            // Category icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.network(
                          'http://devapiv4.dealsdray.com/icons/cat_mobile.png',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Mobile'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.network(
                          'http://devapiv4.dealsdray.com/icons/cat_lap.png',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Laptops'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.network(
                          'http://devapiv4.dealsdray.com/icons/cat_camera.png',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Camera'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: Image.network(
                          'http://devapiv4.dealsdray.com/icons/cat_led.png',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('LED'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            // Exclusive product cards
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB2FEFA),
                    Color(0xFF4AC29A),
                  ], // Light blue gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha:0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Row(
                    children: [
                      const Text(
                        'EXCLUSIVE FOR YOU',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Product cards
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, idx) {
                        final product = products[idx];
                        return Stack(
                          children: [
                            Container(
                              width: 140,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha:0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product image
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      product['icon']!,
                                      height: 200,
                                      width: 140,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 14,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      product['label']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      product['SubLabel'] ??
                                          product['Sublabel'] ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Discount badge
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "${product['offer'] ?? ''} OFF",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Your chat logic here
        },
        backgroundColor: Color(0xFFD32F2F),
        icon: Icon(Icons.chat_outlined, color: Colors.white),
        label: Text(
          'Chat Now',
          style: GoogleFonts.poppins(fontSize:17,color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
