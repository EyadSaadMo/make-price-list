import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/core/components/sqflite/queres_screen.dart';
import 'package:work/core/components/widgets/divider/divider_screen.dart';

import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/layout/layout_screen.dart';
import 'package:work/modules/details/details_screen.dart';
import 'package:work/modules/setting/setting_screen.dart';

import '../routes/routes_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Color color= const Color(0xff79b473);
  SqlDatabase sqlDatabase = SqlDatabase();
  List categories = [];
  bool isLoading= true;
  Future readData()async{
    List<Map> response  = await sqlDatabase.read('categories');
    categories.addAll(response);
    isLoading = false;
    if(mounted){
      setState(() {});
    }
  }
  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Material(
      child: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // Important: Remove any padding from the ListView.
              // padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 120,
                  child: DrawerHeader(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Image(
                                image: AssetImage('assets/images/checklist.jpg'),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Make Price List',
                                style: Theme.of(context).textTheme.bodyText1
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Fast & Easy Price List Maker',
                                style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Row(
                          children: [
                            const Icon(Icons.menu_rounded),
                            const SizedBox(
                              width: 10,
                            ),
                             Text(
                              'All items',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Expanded(child: SizedBox()),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).iconTheme.color,
                              radius: 12,
                              child: Text(
                                '2',
                                style:  Theme.of(context).textTheme.bodyText1!.copyWith(color:AppCubit.get(context).isDark?textColor.withOpacity(0.6):Colors.white),
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          navigateTo(context, const HomeScreen());
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                     const MyDivider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'CATEGORIES',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (ctx,index)=>InkWell(
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration:  const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(child: Text('${categories[index]['name']}',style: Theme.of(context).textTheme.bodyText1)),
                                ],
                              ),
                            ),
                            onTap: (){
                              navigateAndFinish(context, DetailsScreen(itemName: categories[index]['name']));
                            },
                          ),),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        child: Row(
                          children: [
                            const Icon(Icons.menu_rounded),
                            const SizedBox(
                              width: 10,
                            ),
                             Text(
                              'Uncategorized',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Expanded(child: SizedBox()),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).iconTheme.color,
                              radius: 12,
                              child: Text(
                                '2',
                                style:  Theme.of(context).textTheme.bodyText1!.copyWith(color:AppCubit.get(context).isDark?textColor.withOpacity(0.6):Colors.white),
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          navigateTo(context, const HomeScreen());
                        },
                      ),
                        const SizedBox(height: 160,),
                        // const Expanded(child: SizedBox()),
                      // Expanded(child: Align(alignment: FractionalOffset.bottomCenter,)),

                      const MyDivider(),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        child: Row(
                          children:  [
                            const Icon(Icons.settings),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Settings',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        onTap: (){
                          navigateTo(context, SettingScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
