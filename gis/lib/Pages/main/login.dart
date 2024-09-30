import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/Pages/home.dart';
import 'package:myproject/Pages/map.dart';
import 'package:myproject/Pages/main/signup.dart';
import '../../main/function/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter both username and password.';
      });
      return;
    }

    // Prepare the POST request
    var url = Uri.parse(login.loginUrl);
    var response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    // Handle the response
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        // Navigate to SatelliteMapView on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SatelliteMapView()),
        );
      } else {
        setState(() {
          _errorMessage = responseData['message'];
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Login failed. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xffD4E3FF),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              Text(
                'GIS พืชอัตลักษณ์\nอำเภอบางกล่ำ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(30.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        'ยินดีต้อนรับ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'โปรดเข้าสู่ระบบก่อนใช้งาน',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      if (_errorMessage.isNotEmpty)
                        Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: _login,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 46, 132, 177),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Center(
                            child: Text(
                              'เข้าสู่ระบบ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ลงทะเบียนเกษตรกร ?",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Text(
                                      'ลงทะเบียน',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff3D42DC),
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}