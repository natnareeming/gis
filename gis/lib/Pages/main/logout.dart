import 'package:flutter/material.dart';
import 'package:myproject/Pages/main/login.dart';
import '../home.dart'; // Import the home page or login page

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return false; // Prevent the default back button action
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Logout'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ยืนยันเพื่อออกจากระบบ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to home or login page
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('ออกจากระบบ'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}