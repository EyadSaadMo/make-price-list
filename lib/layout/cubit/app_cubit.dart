import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/constatns/constant.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool closedBottomSheet= false;
   late Database database;
  List<Map> categoriesList=[];
  List<Map> unCategoriesList=[];


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
          getDataFromDatabase(database).then((value) {
           categoriesList =value;
            print(categoriesList);
           emit(AppGetDatabaseItemState());
          });
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
        getDataFromDatabase(database).then((value) {
          categoriesList =value;
          print(categoriesList);
          emit(AppGetDatabaseItemState());
        });
      }).catchError((error){
        print('error when inserting records in table ${error.toString()}');
      });
    });

  }



  void createDataBase() {
    openDatabase('list.db', version: 1, onCreate: (database, version) async {
      print('database is created');
      await database.execute('CREATE TABLE list(id INTEGER PRIMARY KEY,name )')
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

  Future< List<Map>> getDataFromDatabase(database)async{
    emit(AppGetDatabaseLoadingItemState());
  return await database.rawQuery('SELECT * FROM item ');

  } Future< List<Map>> getDataFromDatabase2(database)async{
 emit(AppGetDatabaseLoadingState());
  return await database.rawQuery('SELECT * FROM list ');
  }

}