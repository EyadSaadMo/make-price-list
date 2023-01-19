import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/core/components/sqflite/queres_screen.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/layout/layout_screen.dart';
import 'package:work/modules/edit_categories/edit_categories_screen.dart';

import '../../core/components/widgets/routes/routes_screen.dart';
import '../add_new_category/add_new_category_screen.dart';

class CategoriesScreen extends StatefulWidget {
   const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

   SqlDatabase sqlDatabase = SqlDatabase();

   bool isLoading= true;

   List catName = [] ;

   Future readData() async {
     List<Map> response = await sqlDatabase.read('categories');
     catName.addAll(response);
     isLoading = false;
     if(mounted){
       setState(() {});
     }
   }
  @override
  void initState() {
    readData();
    super.initState();
  }

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

      appBar: AppBar(
        leading: IconButton(onPressed: (){navigateTo(context, const HomeScreen());}, icon: Icon(Icons.arrow_back,color: Theme.of(context).iconTheme.color,),),
        title: Text('Manage categories',style:Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(onPressed: (){
            if(cubit.closedBottomSheet){
              Navigator.pop(context);
              cubit.closedBottomSheet=false;
            }
            else{
              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                height: 220,
                color: Theme.of(context).bottomSheetTheme.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('SORT BY',style: Theme.of(context).textTheme.caption),
                      GestureDetector(
                        child:  ListTile(
                          leading: const Icon( Icons.sort_by_alpha_outlined,color: Colors.deepOrangeAccent,),
                          title: Text('Alphabetically',style: Theme.of(context).textTheme.bodyText1),
                        ),
                        onTap: (){},
                      ),
                      GestureDetector(
                        child:  ListTile(
                          leading: const Icon( Icons.arrow_upward,color: Colors.deepOrangeAccent),
                          title: Text('Newest First',style: Theme.of(context).textTheme.bodyText1),
                        ),
                        onTap: (){},
                      ),
                      GestureDetector(
                        child:  ListTile(
                          leading: const Icon( Icons.arrow_downward,color: Colors.deepOrangeAccent),
                          title: Text('Oldest First',style:Theme.of(context).textTheme.bodyText1),
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
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
               Text('Manage categories',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14)),
               const Spacer(),
               Text('NO. OF ITEMS',style: Theme.of(context).textTheme.caption),

              ],
            ),
          ),
           ListView.builder(
                    itemCount: catName.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx,index){
                      return InkWell(
                        child: SizedBox(
                          height: 50,
                          child: Card(
                            color: Theme.of(context).appBarTheme.backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(child: Text('${catName[index]['name']}',style: Theme.of(context).textTheme.bodyText1)),
                                 const Spacer(),
                                  Text('0',style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.grey.shade600,fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: (){
                          navigateAndFinish(context, EditCategoriesScreen(
                              itemName: catName[index]['name'],
                              id: catName[index]['id'],
                          ),);
                        },
                      );

                    },

           ),
          const SizedBox(height: 15,),
          Container(
            height: 50,
            color:Theme.of(context).inputDecorationTheme.fillColor,
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('UnCategories',style:Theme.of(context).textTheme.bodyText1),
                  const Spacer(),
                  Text('4',style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey.shade600,fontSize: 14)),
                ],
              ),
            ),
          ),


        ],
      ),
      floatingActionButton:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 130),
        child: Container(
          width: 60,
          height: 60,
          decoration:  const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrangeAccent
          ),
          child: IconButton(onPressed: (){
            navigateTo(context, const AddNewCategoryScreen());
          }, icon: const Icon(Icons.add)),
        ),
      ),
    );
  },
);
  }
}
