
import 'package:floor/floor.dart';
import 'package:flutter_news/src/data/local/db/read_history.dart';

@dao
abstract class ReadHistoryDao
{
   @Query('SELECT * FROM read_history')
   Future<List<ReadHistory>> findAllHistorys();

   @Query('SELECT * FROM read_history WHERE id = :id')
   Stream<ReadHistory?> findHistoryById(int id);

   @insert
   Future<void> insertHistory(ReadHistory history);

   @insert
   Future<void> insertHistorys(List<ReadHistory> history);

   @update
   Future<int> updateHistorys(List<ReadHistory> history);

   @delete
   Future<int> deleteHistory(ReadHistory history);

   @Query('DELETE FROM read_history')
   Future<void> deleteAllHistorys();

}