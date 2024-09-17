import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SatelliteMapView extends StatefulWidget {
  const SatelliteMapView({Key? key}) : super(key: key);

  @override
  _SatelliteMapViewState createState() => _SatelliteMapViewState();
}

class _SatelliteMapViewState extends State<SatelliteMapView> {
  late GoogleMapController mapController;

  // พิกัดของพื้นที่ที่ต้องการแสดง (ตัวอย่าง - ปรับให้ตรงกับพื้นที่ที่คุณต้องการ)
  final LatLng _center = const LatLng(7.0089, 100.4097);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แผนที่ดาวเทียม'),
      ),
      body: GoogleMap(
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
    );
  }
}