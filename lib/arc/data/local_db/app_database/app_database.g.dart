// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

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

  AppUserDao? _appUserDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `AppUser` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `avatar` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AppUserDao get appUserDao {
    return _appUserDaoInstance ??= _$AppUserDao(database, changeListener);
  }
}

class _$AppUserDao extends AppUserDao {
  _$AppUserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _appUserInsertionAdapter = InsertionAdapter(
            database,
            'AppUser',
            (AppUser item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'avatar': item.avatar
                },
            changeListener),
        _appUserDeletionAdapter = DeletionAdapter(
            database,
            'AppUser',
            ['id'],
            (AppUser item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'avatar': item.avatar
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AppUser> _appUserInsertionAdapter;

  final DeletionAdapter<AppUser> _appUserDeletionAdapter;

  @override
  Future<List<AppUser>> findAllAppUsers() async {
    return _queryAdapter.queryList('SELECT * FROM AppUser',
        mapper: (Map<String, Object?> row) => AppUser(
            name: row['name'] as String,
            avatar: row['avatar'] as String,
            id: row['id'] as String));
  }

  @override
  Stream<AppUser?> findUserById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM AppUser WHERE id = ?1',
        mapper: (Map<String, Object?> row) => AppUser(
            name: row['name'] as String,
            avatar: row['avatar'] as String,
            id: row['id'] as String),
        arguments: [id],
        queryableName: 'AppUser',
        isView: false);
  }

  @override
  Future<void> insertAppUser(List<AppUser> users) async {
    await _appUserInsertionAdapter.insertList(users, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAppUser(List<AppUser> users) async {
    await _appUserDeletionAdapter.deleteList(users);
  }
}
