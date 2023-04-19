// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ReadHistoryDao? _readHistoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `read_history` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `cid` INTEGER, `title` TEXT NOT NULL, `link` TEXT NOT NULL, `timestamp` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ReadHistoryDao get readHistoryDao {
    return _readHistoryDaoInstance ??=
        _$ReadHistoryDao(database, changeListener);
  }
}

class _$ReadHistoryDao extends ReadHistoryDao {
  _$ReadHistoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _readHistoryInsertionAdapter = InsertionAdapter(
            database,
            'read_history',
            (ReadHistory item) => <String, Object?>{
                  'id': item.id,
                  'cid': item.cid,
                  'title': item.title,
                  'link': item.link,
                  'timestamp': _dateTimeConverter.encode(item.timestamp)
                },
            changeListener),
        _readHistoryUpdateAdapter = UpdateAdapter(
            database,
            'read_history',
            ['id'],
            (ReadHistory item) => <String, Object?>{
                  'id': item.id,
                  'cid': item.cid,
                  'title': item.title,
                  'link': item.link,
                  'timestamp': _dateTimeConverter.encode(item.timestamp)
                },
            changeListener),
        _readHistoryDeletionAdapter = DeletionAdapter(
            database,
            'read_history',
            ['id'],
            (ReadHistory item) => <String, Object?>{
                  'id': item.id,
                  'cid': item.cid,
                  'title': item.title,
                  'link': item.link,
                  'timestamp': _dateTimeConverter.encode(item.timestamp)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ReadHistory> _readHistoryInsertionAdapter;

  final UpdateAdapter<ReadHistory> _readHistoryUpdateAdapter;

  final DeletionAdapter<ReadHistory> _readHistoryDeletionAdapter;

  @override
  Future<List<ReadHistory>> findAllHistorys() async {
    return _queryAdapter.queryList('SELECT * FROM read_history',
        mapper: (Map<String, Object?> row) => ReadHistory(
            row['id'] as int?,
            row['cid'] as int?,
            row['title'] as String,
            row['link'] as String,
            _dateTimeConverter.decode(row['timestamp'] as int)));
  }

  @override
  Stream<ReadHistory?> findHistoryById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM read_history WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ReadHistory(
            row['id'] as int?,
            row['cid'] as int?,
            row['title'] as String,
            row['link'] as String,
            _dateTimeConverter.decode(row['timestamp'] as int)),
        arguments: [id],
        queryableName: 'read_history',
        isView: false);
  }

  @override
  Future<void> deleteAllHistorys() async {
    await _queryAdapter.queryNoReturn('DELETE FROM read_history');
  }

  @override
  Future<void> insertHistory(ReadHistory history) async {
    await _readHistoryInsertionAdapter.insert(
        history, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertHistorys(List<ReadHistory> history) async {
    await _readHistoryInsertionAdapter.insertList(
        history, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateHistorys(List<ReadHistory> history) {
    return _readHistoryUpdateAdapter.updateListAndReturnChangedRows(
        history, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteHistory(ReadHistory history) {
    return _readHistoryDeletionAdapter.deleteAndReturnChangedRows(history);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
