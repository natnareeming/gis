import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPdpaChecked = false; // ตัวแปรสำหรับเช็คสถานะ PDPA
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6F0FF), // สีพื้นหลังอ่อน
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
                _buildTextField('ชื่อ'),
                _buildTextField('นามสกุล'),
                _buildTextField('บ้านเลขที่'),
                _buildDropdown('หมู่'),
                _buildDropdown('ตำบล'),
                _buildDropdown('อำเภอ'),
                _buildDropdown('จังหวัด'),
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
                    onPressed: _isPdpaChecked
                        ? () {
                            if (_passwordController.text ==
                                _confirmPasswordController.text) {
                              // ดำเนินการลงทะเบียน
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('ลงทะเบียนสำเร็จ!'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('รหัสผ่านไม่ตรงกัน!'),
                                ),
                              );
                            }
                          }
                        : null, // ปุ่มจะใช้งานได้เมื่อยืนยัน PDPA แล้ว
                    child: Text('ลงทะเบียน'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างช่องกรอกข้อมูล
  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างช่องกรอกรหัสผ่าน
  Widget _buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
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
      ),
    );
  }

  // ฟังก์ชันสร้าง Dropdown
  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        items: [
          DropdownMenuItem(child: Text("เลือก $label"), value: ""),
          // สามารถเพิ่มรายการอื่น ๆ ได้
        ],
        onChanged: (value) {},
      ),
    );
  }
}
