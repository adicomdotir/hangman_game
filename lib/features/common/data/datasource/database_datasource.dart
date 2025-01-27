import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/index.dart';

@singleton
class DatabaseDataSource {
  static const _kTableWords = 'words';
  static const _kColumnId = 'id';
  static const _kColumnWord = 'word';
  static const _kColumnLevel = 'book_level';
  static const _kColumnLesson = 'book_lesson';
  static const _kColumnTypeId = 'type_id';
  static const _kColumnWordType = 'word_types';
  static const _kColumnMean = 'mean';

  Database? _database;

  bool isOpen() => _database != null;

  Future<void> open() async {
    final path =
        join(await databaseFactory.getDatabasesPath(), 'app_database.db');
    _database = await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        onCreate: (db, version) async {
          await _createTables(db);
        },
        onUpgrade: _onUpgrade,
        version: 3,
      ),
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      // Drop existing tables (if necessary)
      await db.execute('DROP TABLE IF EXISTS $_kTableWords');

      // Recreate tables with updated schema
      await _createTables(db);
    }
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
            CREATE TABLE $_kTableWords (
              $_kColumnId INTEGER PRIMARY KEY,
              $_kColumnWord TEXT,
              $_kColumnLevel TEXT,
              $_kColumnLesson TEXT,
              $_kColumnTypeId INTEGER,
              $_kColumnWordType TEXT,
              $_kColumnMean TEXT
            )
          ''');
  }

  void addWord(WordModel wordModel) async {
    try {
      final id = await _database!.insert(
        _kTableWords,
        {
          _kColumnWord: wordModel.word,
          _kColumnLevel: wordModel.bookLevel,
          _kColumnLesson: wordModel.bookLesson,
          _kColumnTypeId: wordModel.typeId,
          _kColumnWordType: jsonEncode({
            'id': wordModel.wordType.id,
            'name': wordModel.wordType.name,
            'shortName': wordModel.wordType.shortName,
          }),
          _kColumnMean: wordModel.mean,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      // return Result.ok(Todo(id: id, task: task));
    } on Exception catch (e) {
      debugPrint(e.toString());
      // return Result.error(e);
    }
  }

  void deleteWord(int id) async {
    try {
      final rowsDeleted = await _database!
          .delete(_kTableWords, where: '$_kColumnId = ?', whereArgs: [id]);
      if (rowsDeleted == 0) {
        debugPrint('No word found with id $id');
        // return Result.error(Exception('No todo found with id $id'));
      }
      // return Result.ok(null);
    } on Exception catch (e) {
      debugPrint(e.toString());
      // return Result.error(e);
    }
  }

  Future<List<WordModel>> fetchWords() async {
    try {
      final entries = await _database!.query(
        _kTableWords,
      );
      // print(entries);
      final list = entries.map(
        (element) {
          final wtMap = jsonDecode(element[_kColumnWordType] as String);
          final wordTypeModel = WordTypeModel(
            id: wtMap['id'],
            name: wtMap['name'],
            shortName: wtMap['shortName'],
          );
          return WordModel(
            id: element[_kColumnId] as int,
            word: element[_kColumnWord] as String,
            bookLevel: element[_kColumnLesson] as String,
            bookLesson: element[_kColumnLevel] as String,
            typeId: element[_kColumnTypeId] as int,
            wordType: wordTypeModel,
            mean: element[_kColumnMean] as String,
          );
        },
      ).toList();
      return list;
      // return Result.ok(list);
    } on Exception catch (e) {
      debugPrint(e.toString());
      // return Result.error(e);
      return [];
    }
  }

  Future close() async {
    await _database?.close();
    _database = null;
  }
}
