import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:work/core/components/routes/routes_screen.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/modules/add_new_item/add_new_item_screen.dart';
import 'package:work/modules/categories/categories_screen.dart';
import 'package:work/modules/notifications/notifications_screen.dart';
import '../core/components/drawer/drawer_screen.dart';
import '../core/constatns/constant.dart';
import '../modules/qr_scan/scan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final drawerKey = GlobalKey<ScaffoldState>();
  int currentIndex = 1;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var itemNameController = TextEditingController();
  var weightController = TextEditingController();
  var quantityController = TextEditingController();
  var costPriceController = TextEditingController();
  var salePriceController = TextEditingController();
  var descriptionController = TextEditingController();
  var codeController = TextEditingController();
  var itemController = TextEditingController();
  String descriptionText = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createItemsInDataBase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          state is AppGetDatabaseItemState;
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: screenColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: textColor),
              backgroundColor: defaultColor,
              elevation: 0.0,
              title: Text(
                'All Item',
                style: TextStyle(color: textColor),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    if (cubit.closedBottomSheet) {
                      Navigator.pop(context);
                      cubit.closedBottomSheet = false;
                    } else {
                      scaffoldKey.currentState!
                          .showBottomSheet(
                            (context) =>
                            Container(
                              height: 180,
                              color: defaultColor,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SORT BY',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: textColor.withOpacity(0.4)),
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.sort_by_alpha_outlined,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        title: Text(
                                          'Alphabetically',
                                          style: TextStyle(
                                              fontSize: 12, color: textColor),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    GestureDetector(
                                      child: ListTile(
                                        leading: const Icon(
                                            Icons.price_change_outlined,
                                            color: Colors.deepOrangeAccent),
                                        title: Text(
                                          'Sale Price',
                                          style: TextStyle(
                                              fontSize: 12, color: textColor),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      )
                          .closed
                          .then((value) {
                        cubit.closedBottomSheet = false;
                      });
                      cubit.closedBottomSheet = true;
                    }
                  },
                  icon: Icon(
                    Icons.sort_outlined,
                    color: textColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (cubit.closedBottomSheet) {
                      cubit.insertInDatabase(itemName: itemController.text);
                      cubit.getDataFromDatabase2(cubit.database).then((value) {
                        Navigator.pop(context);
                       cubit.unCategoriesList = value;
                        print(cubit.unCategoriesList);
                      });

                      cubit.closedBottomSheet = false;
                    } else {
                      scaffoldKey.currentState!
                          .showBottomSheet((context) =>
                          Container(
                            height: 200,
                            color: defaultColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text('Choose Export File Type',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: textColor,
                                          ))),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                              'A preview will be display before export',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: textColor
                                                    .withOpacity(0.4),
                                              ))))
                                ],
                              ),
                            ),
                          ))
                          .closed
                          .then((value) {
                        cubit.closedBottomSheet = false;
                      });
                      cubit.closedBottomSheet = true;
                    }
                  },
                  icon: Icon(
                    Icons.download_for_offline_sharp,
                    color: textColor,
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              backgroundColor: screenColor,
              child: const MyDrawer(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: defaultColor,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: defaultColor,
                        hintText: 'Search item or category',
                        suffixIcon: IconButton(
                          onPressed: () {
                            navigateTo(context, const ScanScreen());
                          },
                          icon: Icon(
                            Icons.document_scanner_outlined,
                            color: textColor,
                          ),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                        itemBuilder: (ctx, index) =>
                            GestureDetector(child: buildItem(cubit.categoriesList[index]),onTap: (){
                              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                                height: 200,
                                color: defaultColor,
                              ));
                            },),
                        separatorBuilder: ((ctx, index) =>
                            Container(
                              color: Colors.grey[300],
                              height: 1.0,
                            )),
                        itemCount: cubit.categoriesList.length),
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(color: defaultColor,height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      children: [
                        IconButton(onPressed: (){navigateTo(context, CategoriesScreen());}, icon: Icon(Icons.dataset_outlined,color: textColor,),),
                        Text('Categories',style: TextStyle(color: textColor),),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrangeAccent
                          ),
                          child: IconButton(onPressed: (){navigateTo(context, AddingNewItemScreen());}, icon: Icon(Icons.add,color: textColor,),)),
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){navigateTo(context, NotificationsScreen());}, icon: Icon(Icons.notifications,color: textColor,),),
                        Text('Notifications',style: TextStyle(color: textColor),),
                      ],
                    ),
                ],),
                  ),),
              ],
            ),
            // body:cubit.screens.elementAt(cubit.currentIndex),
          );
        },
      ),
    );
  }

 Widget buildItem(Map model,) {
    return Container(
      height: 30,
      color: defaultColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model['name'],
              style: TextStyle(color: textColor,fontSize: 18,fontWeight: FontWeight.bold),
            ),
            Text(
              model['salePrice'].toString(),
              style: TextStyle(color: textColor,fontSize: 18,),
            ),
          ],
        ),
      ),
    );
  }
}
