import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDatabase {

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await initialDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }


  initialDb() async {
    String databasePath = await getDatabasesPath() ;
    String path = join(databasePath , 'mo.db') ;
    Database myDb = await openDatabase(path , onCreate: _onCreate , version: 1, onUpgrade:_onUpgrade ) ;
    return myDb ;
  }

  _onUpgrade(Database db , int oldVersion , int newVersion ) {
    print("onUpgrade =====================================") ;
  }

  _onCreate(Database db , int version) async {
    Batch batch = db.batch();
     batch.execute('''
  CREATE TABLE item( 
  id INTEGER PRIMARY KEY,
  name TEXT,
  weight TEXT,
  quantity INTEGER,
  costPrice INTEGER,
  salePrice INTEGER,
  description TEXT,
  code TEXT)
 ''');
     
     batch.execute('''
  CREATE TABLE categories( 
    id INTEGER PRIMARY KEY,
  name TEXT)
 ''');
     await batch.commit();
    print(" onCreate =====================================") ;

  }

  read(String table) async {
    Database? myDb = await db ;
    List<Map> response = await  myDb!.query(table);
    return response ;
  }
  insert(String table,Map<String, Object?> values) async {
    Database? myDb = await db ;
    int  response = await  myDb!.insert(table, values);
    return response ;
  }
  update(String table,Map<String, Object?> values,String? myWhere) async {
    Database? myDb = await db ;
    int  response = await  myDb!.update(table, values,where: myWhere);
    return response ;
  }
  delete(String table,Map<String, Object?> values,String? myWhere) async {
    Database? myDb = await db ;
    int  response = await  myDb!.delete(table,where: myWhere);
    return response ;
  }

// SELECT
// DELETE
// UPDATE
// INSERT
}