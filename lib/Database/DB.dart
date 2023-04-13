import 'dart:async';

import 'package:flutter_oauth/Database/Tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DB {

  String name = 'CakeShop';
  int version = 1;

  Future<Database> open() async{
    String path = join(await getDatabasesPath(), name);
    return openDatabase(
      path,
      version: version,
      onCreate: onCreate,
    );
  }


  FutureOr<void> onCreate(Database db, int version) {
    Tables.TABLES.forEach((sql) async => await db.execute(sql));
  }
}