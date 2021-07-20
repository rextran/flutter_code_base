import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../local_db/daos/app_user_dao.dart';
import '../../../data/models/app_user.dart';
import '../daos/app_user_dao.dart';

part 'app_database.g.dart';

// flutter packages pub run build_runner build
@Database(version: 1, entities: [AppUser])
abstract class AppDatabase extends FloorDatabase {
  AppUserDao get appUserDao;
}

class AppDB {
  late AppDatabase database;

  Future<void> initAppDB() async {
    try {
      database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    } catch (e) {
      rethrow;
    }
  }
}
