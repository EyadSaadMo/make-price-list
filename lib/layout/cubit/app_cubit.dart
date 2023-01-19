import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../core/network/local/cache_helper.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<Color> colors = [
    const Color(0xff79b473),
    const Color(0xff70a37f),
    const Color(0xff41658a),
    const Color(0xff414073),
    const Color(0xffcaffd0),
    const Color(0xffc9e4e7),
    const Color(0xffb4a0e5),
    const Color(0xffca3cff),
    const Color(0xff3e92cc),
    const Color(0xff2a628f),
    const Color(0xff18435a),
  ];

  bool closedBottomSheet= false;
   late Database database;
  List<Map> categoriesList=[];
  List<Map> unCategoriesList=[];
  Uri gmailUrl = Uri.parse('mailto:eyads3514@gmail.com?subject=&body=');
  List<String> themeTitle = ['light','dark'];
  bool isDark = false;
  changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeThemeModeState());
    }
    else{
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeModeState());

      });
    }

  }
  List<String> items = ['Categories','unCategories','undefined'];

  String dropDownValue='Categories';


 //  void createItemsInDataBase()
 //  {
 //    openDatabase('item.db', version: 1, onCreate: (database, version) async {
 //      print('database is created');
 //      await database.execute(
 //          'CREATE TABLE item(id INTEGER PRIMARY KEY,name TEXT,weight INTEGER,quantity INTEGER,costPrice INTEGER,salePrice INTEGER,description TEXT,code TEXT)')
 //          .then((value)
 //      {
 //        print('table created');
 //      }).catchError((error) {
 //        print('error when creating table ${error.toString()}');
 //      });
 //    },
 //        onOpen: (database) {
 //          print('database is opened');
 //        }).then((value) {
 //      database = value;
 //      emit(AppCreatedDatabaseItemState());
 //    });
 //  }
 //  insertRecordInDatabase(
 //      {
 //    required String name,
 //    required int weight ,
 //    required int quantity,
 //    required double costPrice,
 //    required double salePrice,
 //    required String? description,
 //    required String code,
 //  }
 //  )
 //  {
 //    database.transaction((txn)async {
 //      await txn.rawInsert('INSERT INTO item(name,weight,quantity,costPrice,salePrice,description,code) VALUES ("$name",$weight,$quantity,$costPrice,$salePrice,"$description","$code")').
 //      then((value)  {
 //        print('$value inserted successfully');
 //         emit(AppInsertedItemInDatabaseState());
 //        getDataFromDatabase(database);
 //      }).catchError((error){
 //        print('error when inserting records in table ${error.toString()}');
 //      });
 //    });
 //
 //  }
 //
 //
 //
 //  void createDataBase() {
 //    openDatabase('list.db',version: 1, onCreate: (database, version) async {
 //      print('database is created');
 //      await database.execute('CREATE TABLE list(id INTEGER PRIMARY KEY,name TEXT)')
 //          .then((value)
 //      {
 //        print('table created');
 //      }).catchError((error) {
 //        print('error when creating table ${error.toString()}');
 //      });
 //    },
 //        onOpen: (database) {
 //          getDataFromDatabase2(database).then((value) {
 //            unCategoriesList=value;
 //            emit(AppInsertedInDatabaseState());
 //          });
 //          print('database is opened');
 //        }).then((value) {
 //      database = value;
 //      emit(AppCreatedDatabaseState());
 //    });
 //  }
 //
 //
 //  insertInDatabase({
 //    required String itemName,
 //
 //
 //  })
 //  {
 //    database.transaction((txn)async {
 //      await txn.rawInsert('INSERT INTO list (name) VALUES ("$itemName")').
 //      then((value)  {
 //        print('$value inserted successfully');
 //        emit(AppInsertedInDatabaseSuccessState());
 //      }).catchError((error){
 //        print('error when inserting records in table ${error.toString()}');
 //      });
 //    });
 //  }
 //
 //  void getDataFromDatabase(database){
 //  return  database.rawQuery('SELECT * FROM item '). then((value)  {
 //   emit(AppGetDatabaseLoadingItemState());
 //  }).catchError((error){
 //    print('error when inserting records in table ${error.toString()}');
 //  });
 //
 //  }
 //  Future< List<Map>> getDataFromDatabase2(database)async{
 // emit(AppGetDatabaseLoadingState());
 //  return await database.rawQuery('SELECT * FROM list ');
 //  }

}

