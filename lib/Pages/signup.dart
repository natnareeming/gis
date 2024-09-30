import 'package:flutter/material.dart';
import 'package:myproject/Pages/login.dart';
import 'package:myproject/services/database.connection.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPdpaChecked = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _houseNumberController = TextEditingController();
  final _villageController = TextEditingController();
  final _subdistrictController = TextEditingController();
  final _districtController = TextEditingController();
  final _provinceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6F0FF),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'ลงทะเบียนเกษตรกร',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField('ชื่อ', _firstNameController),
                  _buildTextField('นามสกุล', _lastNameController),
                  _buildTextField('บ้านเลขที่', _houseNumberController),
                  _buildTextField('หมู่', _villageController),
                  _buildTextField('ตำบล', _subdistrictController),
                  _buildTextField('อำเภอ', _districtController),
                  _buildTextField('จังหวัด', _provinceController),
                  _buildPasswordField('รหัสผ่าน', _passwordController),
                  _buildPasswordField('ยืนยันรหัสผ่าน', _confirmPasswordController),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: _isPdpaChecked,
                        onChanged: (value) {
                          setState(() {
                            _isPdpaChecked = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'ฉันยอมรับข้อกำหนดในการใช้ข้อมูล (PDPA)',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isPdpaChecked ? _handleSignUp : null,
                      child: Text('ลงทะเบียน'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _testDatabaseConnection,
                      child: Text('ทดสอบการเชื่อมต่อ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'กรุณากรอก$label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          }
          return null;
        },
      ),
    );
  }

  void _testDatabaseConnection() async {
    try {
      var db = await DatabaseConnection.getConnection();
      var result = await db.collection('farmers').find().toList();
      print("Connected successfully. Found ${result.length} documents.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เชื่อมต่อสำเร็จ! พบ ${result.length} รายการ')),
      );
    } catch (e) {
      print("Connection error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาดในการเชื่อมต่อ: $e')),
      );
    }
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('รหัสผ่านไม่ตรงกัน!')),
        );
        return;
      }

      var bytes = utf8.encode(_passwordController.text);
      var digest = sha256.convert(bytes);
      String hashedPassword = digest.toString();

      Map<String, dynamic> farmerData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'houseNumber': _houseNumberController.text,
        'village': _villageController.text,
        'subdistrict': _subdistrictController.text,
        'district': _districtController.text,
        'province': _provinceController.text,
        'password': hashedPassword,
      };

      try {
        await DatabaseConnection.insert('farmers', farmerData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ลงทะเบียนสำเร็จ!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('เกิดข้อผิดพลาดในการลงทะเบียน: $e')),
        );
      }
    }
  }
}