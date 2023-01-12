import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool closedBottomSheet= false;
   late Database database;
  List<Map> categoriesList=[];
  List<Map> unCategoriesList=[];
  Uri gmailUrl = Uri.parse('mailto:eyads3514@gmail.com?subject=&body=');

  bool isDark = false;
  changeAppMode(){
    isDark = !isDark;
    emit(AppChangeThemeModeState());
  }
  List<String> items = ['Categories','unCategories','undefined'];

  String dropDownValue='Categories';


  void createItemsInDataBase()
  {
    openDatabase('item.db', version: 1, onCreate: (database, version) async {
      print('database is created');
      await database.execute(
          'CREATE TABLE item(id INTEGER PRIMARY KEY,name TEXT,weight INTEGER,quantity INTEGER,costPrice INTEGER,salePrice INTEGER,description TEXT,code TEXT)')
          .then((value)
      {
        print('table created');
      }).catchError((error) {
        print('error when creating table ${error.toString()}');
      });
    },
        onOpen: (database) {
          print('database is opened');
        }).then((value) {
      database = value;
      emit(AppCreatedDatabaseItemState());
    });
  }
  insertRecordInDatabase(
      {
    required String name,
    required int weight ,
    required int quantity,
    required double costPrice,
    required double salePrice,
    required String? description,
    required String code,
  }
  )
  {
    database.transaction((txn)async {
      await txn.rawInsert('INSERT INTO item(name,weight,quantity,costPrice,salePrice,description,code) VALUES ("$name",$weight,$quantity,$costPrice,$salePrice,"$description","$code")').
      then((value)  {
        print('$value inserted successfully');
         emit(AppInsertedItemInDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error){
        print('error when inserting records in table ${error.toString()}');
      });
    });

  }



  void createDataBase() {
    openDatabase('list.db',version: 1, onCreate: (database, version) async {
      print('database is created');
      await database.execute('CREATE TABLE list(id INTEGER PRIMARY KEY,name TEXT)')
          .then((value)
      {
        print('table created');
      }).catchError((error) {
        print('error when creating table ${error.toString()}');
      });
    },
        onOpen: (database) {
          getDataFromDatabase2(database).then((value) {
            unCategoriesList=value;
            emit(AppInsertedInDatabaseState());
          });
          print('database is opened');
        }).then((value) {
      database = value;
      emit(AppCreatedDatabaseState());
    });
  }


  insertInDatabase({
    required String itemName,


  })
  {
    database.transaction((txn)async {
      await txn.rawInsert('INSERT INTO list (name) VALUES ("$itemName")').
      then((value)  {
        print('$value inserted successfully');
        emit(AppInsertedInDatabaseSuccessState());
      }).catchError((error){
        print('error when inserting records in table ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database){
  return  database.rawQuery('SELECT * FROM item '). then((value)  {
   emit(AppGetDatabaseLoadingItemState());
  }).catchError((error){
    print('error when inserting records in table ${error.toString()}');
  });

  }
  Future< List<Map>> getDataFromDatabase2(database)async{
 emit(AppGetDatabaseLoadingState());
  return await database.rawQuery('SELECT * FROM list ');
  }

}

