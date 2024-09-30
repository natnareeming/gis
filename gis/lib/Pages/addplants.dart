import 'package:flutter/material.dart';

class AddPlants extends StatefulWidget {
  const AddPlants({Key? key}) : super(key: key);

  @override
  _AddPlantsState createState() => _AddPlantsState();
}

class _AddPlantsState extends State<AddPlants> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _plantNameController = TextEditingController();
  final TextEditingController _plantInfoController = TextEditingController();
  final TextEditingController _areaRaiController = TextEditingController();
  final TextEditingController _areaNganController = TextEditingController();
  final TextEditingController _areaWahController = TextEditingController();
  final TextEditingController _plantingTypeController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _expectedHarvestDateController = TextEditingController();
  final TextEditingController _dataCollectionDateController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _diameterController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _expectedYieldController = TextEditingController();
  final TextEditingController _actualYieldController = TextEditingController();
  final TextEditingController _pricePerKgController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD4E3FF),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 92, 127, 193),
        title: const Text('เพิ่มพืช', style: TextStyle(color: Color(0xffffffff),fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('รออนุมัติ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
               Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ชื่อพืช', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                       TextFormField(
                        controller: _plantNameController,
                        decoration: const InputDecoration(labelText: 'ชื่อพืช',border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 25),
                      const Text('ไม่ได้เลือกไฟล์ใด'),
                      ElevatedButton(
                        onPressed: () {
                          // Logic to add image
                        },
                        child: const Text('เพิ่มรูป'),
                      ),
                      SizedBox(height: 25),
                      Text('ข้อมูลเกี่ยวกับพืช', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                       TextFormField(
                        controller: _plantInfoController,
                        decoration: const InputDecoration(labelText: 'ข้อมูลเกี่ยวกับพืช',border: OutlineInputBorder()),
                      ),
                    ],
                  ),  
                ),
              ),
               Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('พื้นที่ปลูก', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _areaRaiController,
                                decoration: const InputDecoration(labelText: 'ไร่',border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _areaNganController,
                                decoration: const InputDecoration(labelText: 'งาน',border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _areaWahController,
                                decoration: const InputDecoration(labelText: 'วา',border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),  
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ลักษณะการปลูก', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                       TextFormField(
                        controller: _plantingTypeController,
                        decoration: const InputDecoration(labelText: '(พืชแซม/พืชหลัก)',border: OutlineInputBorder()),
                      ),
                    ],
                  ),  
                ),
              ),

              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _startDateController,
                        decoration: const InputDecoration(labelText: 'วันที่เริ่มปลูก',border: OutlineInputBorder()),
                        keyboardType: TextInputType.datetime,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _startDateController.text = pickedDate.toString();
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _expectedHarvestDateController,
                        decoration: const InputDecoration(labelText: 'วันที่คาดว่าจะเก็บเกี่ยว',border: OutlineInputBorder()),
                        keyboardType: TextInputType.datetime,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _expectedHarvestDateController.text = pickedDate.toString();
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _dataCollectionDateController,
                        decoration: const InputDecoration(labelText: 'วันที่เก็บข้อมูล',border: OutlineInputBorder()),
                        keyboardType: TextInputType.datetime,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _dataCollectionDateController.text = pickedDate.toString();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
               Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ที่ตั้งแปลง', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _villageController,
                        decoration: const InputDecoration(labelText: 'หมู่ที่', border: OutlineInputBorder()),
                      ),  
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _subDistrictController,
                        decoration: const InputDecoration(labelText: 'ตำบล', border: OutlineInputBorder()),
                      ), 
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _districtController,
                        decoration: const InputDecoration(labelText: 'อำเภอ', border: OutlineInputBorder()),
                      ),  
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _provinceController,
                        decoration: const InputDecoration(labelText: 'จังหวัด', border: OutlineInputBorder()),
                      ),
                    ],
                  ),  
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('เส้นผ่านศูนย์กลาง', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _diameterController,
                                decoration: const InputDecoration(labelText: 'เซนติเมตร', border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ความสูง', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _heightController,
                                decoration: const InputDecoration(labelText: 'เมตร', border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ผลผลิตที่คาดว่า\nจะได้รับ', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _expectedYieldController,
                                decoration: const InputDecoration(labelText: 'กิโลกรัม', border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ผลผลิตที่ได้', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _actualYieldController,
                                decoration: const InputDecoration(labelText: 'กิโลกรัม', border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ราคาต่อกิโลกรัม', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 100,
                              child: TextFormField(
                                controller: _pricePerKgController,
                                decoration: const InputDecoration(labelText: 'บาท', border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Logic to save the form data
                      print("Form submitted");
                      Navigator.pop(context); // Navigate back to the previous page
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 92, 127, 193),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  child: const Text('บันทึก', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

