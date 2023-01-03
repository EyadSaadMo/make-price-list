import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/core/components/routes/routes_screen.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';

import '../add_new_category/add_new_category_screen.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: screenColor,
      appBar: AppBar(
        backgroundColor: defaultColor,
        elevation: 0.0,
        iconTheme: IconThemeData(color: textColor),
        title: Text('Manage categories',style: TextStyle(color: textColor),),
        actions: [
          IconButton(onPressed: (){
            if(cubit.closedBottomSheet){
              Navigator.pop(context);
              cubit.closedBottomSheet=false;
            }
            else{
              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                height: 220,
                color: screenColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('SORT BY',style: TextStyle(fontSize: 12,color: textColor.withOpacity(0.4)),),
                      GestureDetector(
                        child:  ListTile(
                          leading: const Icon( Icons.sort_by_alpha_outlined,color: Colors.deepOrangeAccent,),
                          title: Text('Alphabetically',style: TextStyle(fontSize: 12,color: textColor),),
                        ),
                        onTap: (){},
                      ),
                      GestureDetector(
                        child:  ListTile(
                          leading: const Icon( Icons.arrow_upward,color: Colors.deepOrangeAccent),
                          title: Text('Newest First',style: TextStyle(fontSize: 12,color: textColor),),
                        ),
                        onTap: (){},
                      ),
                      GestureDetector(
                        child:  ListTile(
                          leading: const Icon( Icons.arrow_downward,color: Colors.deepOrangeAccent),
                          title: Text('Oldest First',style: TextStyle(fontSize: 12,color: textColor)),
                          onTap: (){},
                        ),
                      ),],
                  ),
                ),
              ));
              cubit.closedBottomSheet=true;
            }

          }, icon: const Icon(Icons.sort_outlined),),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: defaultColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
               Text('Manage categories',style: TextStyle(color: textColor,fontSize: 14),),
               const Spacer(),
               Text('NO. OF ITEMS',style: TextStyle(color: textColor.withOpacity(0.5),fontSize: 14),),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            height: 50,
            color: defaultColor,
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Manage categories',style: TextStyle(color: textColor),),
                  const Spacer(),
                  Text('2',style: TextStyle(color: textColor),),
                ],
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrangeAccent
                ),
                child: IconButton(onPressed: (){
                  navigateTo(context, AddNewCategoryScreen());
                }, icon: const Icon(Icons.add)),
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }

}
