import 'package:mongo_dart/mongo_dart.dart';

class DatabaseConnection {
  static final String _host = '192.168.1.3'; // สำหรับ Android Emulator
  static final int _port = 27017;
  static final String _dbName = 'farmer_db';
  static Db? _db;

  static Future<Db> getConnection() async {
    if (_db == null || _db!.state != State.OPEN) {
      try {
        final uri = 'mongodb://$_host:$_port/$_dbName';
        _db = await Db.create(uri);
        await _db!.open();
        print("Connected to MongoDB!");
      } catch (e) {
        print("Error connecting to MongoDB: $e");
        rethrow;
      }
    }
    return _db!;
  }

  static Future<void> insert(String collection, Map<String, dynamic> data) async {
    try {
      final db = await getConnection();
      await db.collection(collection).insert(data);
      print("Data inserted successfully");
    } catch (e) {
      print("Error inserting data: $e");
      rethrow;
    }
  }

  static Future<bool> testConnection() async {
    try {
      final db = await getConnection();
      await db.serverStatus();
      return true;
    } catch (e) {
      print("Test connection failed: $e");
      return false;
    }
  }
}