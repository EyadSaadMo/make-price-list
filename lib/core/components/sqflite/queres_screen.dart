import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:work/models/search_model.dart';
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
    // print("onUpgrade =====================================") ;
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
  delete(String table,String? myWhere) async {
    Database? myDb = await db ;
    int  response = await  myDb!.delete(table,where: myWhere);
    return response ;
  }


   Future<List<Map<String, dynamic>>?> getTaskDetail(
      {required String table, String? query, String? orderBy, String? where, int? limit}) async {
    Database? myDb = await db ;
    return myDb!.query(table, orderBy: orderBy, limit: limit, where: where);}
   Future<List<Map<String, dynamic>>?> getTaskItems(
      {required String table, String? query, String? orderBy, String? where, int? limit}) async {
    Database? myDb = await db ;
    return myDb!.query(table, orderBy: orderBy, limit: limit, where: where);}

  Future getAllProducts(String tableProduct) async {
    Database? myDb = await db ;
    final res = await myDb!.rawQuery("SELECT * FROM $tableProduct");
    return res.isNotEmpty ? res.map((c) => SearchTextModel.fromMap(c)).toList() : [];
  }

  Future<List> getAllSearch() async {
    Database? myDb = await db ;
    return  myDb!.query('item');
  }

  // Future<List<SearchTextModel>> getAllSearchByCategory(Category category) async {
  //   final db = await dbProvider.database;
  //   List<Map<String, dynamic>> allRows = await db.rawQuery('''
  //   SELECT * FROM contact
  //   WHERE contact.FK_contact_category = ${category.id}
  //   ''');
  //   List<SearchTextModel> contacts =
  //   allRows.map((contact) => SearchTextModel.fromMap(contact)).toList();
  //   return contacts;
  // }

  Future<List<SearchTextModel>> search(String keyword) async {
    Database? myDb = await db ;
    List<Map<String, dynamic>> allRows = await myDb!
        .query('item', where: 'contactName LIKE ?', whereArgs: ['%$keyword%']);
    List<SearchTextModel> items =
    allRows.map((contact) => SearchTextModel.fromMap(contact)).toList();
    return items;
  }
}

//WHERE name LIKE 'keyword%'
//--Finds any values that start with "keyword"
//WHERE name LIKE '%keyword'
//--Finds any values that end with "keyword"
//WHERE name LIKE '%keyword%'
//--Finds any values that have "keyword" in any position