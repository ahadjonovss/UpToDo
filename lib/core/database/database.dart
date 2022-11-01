import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class LocalDatabase{
  static String tablename="newToDoTable";
  static LocalDatabase getInstance=LocalDatabase._init();

  Database? _database;
  LocalDatabase._init();


  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDb("Todo.db");
      return _database!;
    }
    return _database!;
  }

  Future <Database> _initDb(String fileName) async{
    var dbPath=await getDatabasesPath();
    String path=dbPath+fileName;

    Database database=await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
          String textType = "TEXT";
          String intType = "INTEGER";
          String boolType = "INTEGER";
          await db.execute('''
      Create table $tablename(
       id $idType,
            title $textType, 
            description $textType, 
            date $textType,
            priority $intType,
            isCompleted $boolType,
            time $textType,
            category $textType
      )
      ''');
        }
    );
    return database;
  }


  static Future<Task> insertToDatabase(Task newTodo) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tablename, newTodo.toJson());
    print("HAMMASI YAXSHI");
    return newTodo.copyWith(id: id);
  }

  static Future<List<Task>> getList() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tablename, columns: [
      'id',
      'title',
      'description',
      'date' ,
      'priority' ,
      'isCompleted' ,
      'time' ,
      'category'
    ]);

    var list = listOfTodos.map((e) => Task.fromJson(e)).toList();

    return list;
  }

  static Future<int> deleteTaskById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tablename,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}