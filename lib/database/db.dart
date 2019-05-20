import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Future<String> createDB(String name) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, name);

    if (await new Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await new Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print('Create DB Fail');
      }
    }
    print("PATH:$path");
    return path;
  }

  static Future<bool> createTable(String sqlCreateTable,String path) async {
    Database db = await openDatabase(path);
    try{
      await db.execute(sqlCreateTable);
    }catch(e){
      print("Create table fail:$e");
      return false;
    }finally{
      await db.close();
    }
    return true;
  }

  static Future<bool> rawInsert(String sqlInsert,String path) async {
    Database db = await openDatabase(path);
    try{
      await db.transaction((txn) async {
        int id = await txn.rawInsert(sqlInsert);
        print('insert id:$id');
      });
    }catch(e){
      print("Insert fail:$e");
      return false;
    }finally{
      await db.close();
    }
    print("Insert successful");
    return true;
  }

  static Future<bool> rawDelete(String sqlDelete,String path) async {
    Database db = await openDatabase(path);
    try{
      await db.transaction((txn) async {
        int id = await txn.rawDelete(sqlDelete);
        print('delete id:$id');
      });
    }catch(e){
      print("delete fail:$e");
      return false;
    }finally{
      await db.close();
    }
    print("delete successful:");
    return true;
  }

  static Future<bool> rawUpdate(String sqlUpdate,String path) async {
    Database db = await openDatabase(path);
    try{
      await db.transaction((txn) async {
        int id = await txn.rawUpdate(sqlUpdate);
        print('updata id:$id');
      });
    }catch(e){
      print("updata fail:$e");
      return false;
    }finally{
      await db.close();
    }
    print("updata successful:");
    return true;
  }

  static Future<List> rawQuery(String sqlQuery,String path) async {
    Database db = await openDatabase(path);
    List temp;
    try{
      await db.transaction((txn) async {
         temp = await txn.rawQuery(sqlQuery);
        print('List :$temp');
      });
    }catch(e){
      print("Query fail:$e");
    }finally{
      await db.close();
    }
    print("Query successful:");
    return temp;
  }

}
