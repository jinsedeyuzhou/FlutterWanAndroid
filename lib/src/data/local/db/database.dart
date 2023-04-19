import 'package:floor/floor.dart';
import 'package:flutter_news/src/data/local/db/read_history.dart';
import 'package:flutter_news/src/data/local/db/type_converter.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'read_history_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [ReadHistory])
@TypeConverters([DateTimeConverter])
abstract class AppDatabase extends FloorDatabase
{
   ReadHistoryDao get readHistoryDao;
}