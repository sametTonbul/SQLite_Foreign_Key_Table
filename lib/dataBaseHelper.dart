import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String databaseName = 'movies.sqlite';
  static Future<Database> accessDatabase() async {
    String databaseRoad = join(await getDatabasesPath(), databaseName);
    if (await databaseExists(databaseRoad)) {
      print('Database already installed');
    } else {
      ByteData data = await rootBundle.load('database/$databaseName');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(databaseRoad).writeAsBytes(bytes, flush: true);
      print('Database copied to App');
    }
    return openDatabase(databaseRoad);
  }
}
