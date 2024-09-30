import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'addplants.dart';
 // Import the AddPlants page

class SatelliteMapView extends StatefulWidget {
  const SatelliteMapView({Key? key}) : super(key: key);

  @override
  _SatelliteMapViewState createState() => _SatelliteMapViewState();
}

class _SatelliteMapViewState extends State<SatelliteMapView> {
  late GoogleMapController mapController;

  // พิกัดของพื้นที่ที่ต้องการแสดง (ตัวอย่าง - ปรับให้ตรงกับพื้นที่ที่คุณต้องการ)
  final LatLng _center = const LatLng(7.1078938, 100.4642575);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addUniquePlant() {
    // Navigate to the AddPlants page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPlants()),
    );
  }

  void _searchPlant() {
    // Logic to search for a plant
    // This can be a dialog or a new screen where user can input search criteria
    print("Search plant button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แสดงแผนที่ของอำเภอบางกล่ำ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _searchPlant,
            tooltip: 'Search Plant',
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 17.0, // ปรับระดับการซูมตามต้องการ
            ),
            mapType: MapType.satellite, // กำหนดให้แสดงเป็นภาพดาวเทียม
            myLocationEnabled: true, // เพิ่มปุ่มแสดงตำแหน่งปัจจุบัน
            zoomControlsEnabled: true, // เพิ่มปุ่มควบคุมการซูม
            mapToolbarEnabled: true, // เพิ่มแถบเครื่องมือแผนที่
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: _addUniquePlant,
                tooltip: 'Add Unique Plant',
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}