import 'package:flutter/material.dart';
import 'package:myproject/Pages/map.dart';
import 'package:myproject/Pages/setting.dart';
import 'page2.dart'; // Import the Page2
import 'main/logout.dart'; // Import the LogoutPage
import 'package:myproject/services/database.connection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD4E3FF), // Set background color to light blue
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24.0), // Increase padding for the container
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15.0,
                  offset: Offset(0, 5), // Shadow effect
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'ยินดีต้อนรับเข้าสู่ระบบ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey, // Text color
                      ),
                    ),
                    Text(
                      'ชื่อของคุณ', // Replace with the actual name
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey, // Text color
                      ),
                    ),
                    SizedBox(height: 20), // Add some space between the text and image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0), // Rounded corners for the image
                      child: Image.asset(
                        '../lib/img/4.jpg', // Replace with your image path
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover, // Cover the entire space
                      ),
                    ),
                    SizedBox(height: 30), // Add some space between the image and buttons
                  ]
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity, // Make the button take the full width
                        child: ElevatedButton(
                          onPressed: () {
                            // Add functionality for button A here
                          },
                          child: Text(
                            'เสม็ดขาว',
                            style: TextStyle(
                              fontSize: 24, // Increase font size
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto', // Change font family
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent, // Button color
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add some space between the buttons
                      SizedBox(
                        width: double.infinity, // Make the button take the full width
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Page2()),
                            );
                          },
                          child: Text(
                            'พืชอัตลักษณ์',
                            style: TextStyle(
                              fontSize: 24, // Increase font size
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto', // Change font family
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal, // Button color
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add some space between the buttons
                      SizedBox(
                        width: double.infinity, // Make the button take the full width
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SatelliteMapView()),
                            );
                          },
                          child: Text(
                            'แผนที่',
                            style: TextStyle(
                              fontSize: 24, // Increase font size
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto', // Change font family
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Button color
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Rounded corners
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add some space between the buttons
                    ],
                  ),
                ),
                Column(
                  children: [
                    Divider(), // Add a divider to separate the content from the icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIconButton(
                          context,
                          icon: Icons.logout,
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LogoutPage()),
                            );
                          },
                        ),
                        SizedBox(width: 40), // Add some space between the icons
                        _buildStyledIconButton(
                          context,
                          icon: Icons.settings,
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingsPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to build a styled IconButton
  Widget _buildIconButton(BuildContext context, {required IconData icon, required Color color, required VoidCallback onPressed}) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 40,
        color: color,
        onPressed: onPressed,
      ),
    );
  }

  // Function to build a more styled IconButton
  Widget _buildStyledIconButton(BuildContext context, {required IconData icon, required Color color, required VoidCallback onPressed}) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1), // Background color with opacity
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 5), // Shadow effect
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 40,
        color: Colors.blueAccent, // Icon color
        onPressed: onPressed,
      ),
    );
  }
}