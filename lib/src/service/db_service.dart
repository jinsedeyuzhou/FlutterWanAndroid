import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../data/local/db/database.dart';
import '../data/local/db/read_history.dart';

class DbService extends GetxService {
  /// 需要先Get.put,不然会报错
  static DbService get to => Get.find<DbService>(tag: (DbService).toString());
  late final AppDatabase _database;

  Future<DbService> init() async {
      print("$runtimeType DbService");
      _database =
          await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      print('$runtimeType delays 2 sec');
      print('$runtimeType ready!');
    return this;
  }

  final migration1to2 = Migration(1, 2, (database) async {
    await database.execute('ALTER TABLE readHistory ADD COLUMN os INTEGER');
  });

  void insertReadHistory(ReadHistory readHistory) async {
    print("$runtimeType insertReadHistory $readHistory");
    await _database.readHistoryDao.insertHistory(readHistory);
  }

  Future<List<ReadHistory>> findAllReadHistorys() async {
    print("$runtimeType findAllReadHistorys");
    return await _database.readHistoryDao.findAllHistorys();
  }

  Future<void> deleteAllHistorys() async {
    await _database.readHistoryDao.deleteAllHistorys();
  }
}
