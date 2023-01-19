import 'package:flutter/material.dart';
import 'package:work/core/components/widgets/routes/routes_screen.dart';
import 'package:work/layout/layout_screen.dart';

import '../add_new_item/add_new_item_screen.dart';



class DetailsScreen extends StatelessWidget {
   const DetailsScreen({Key? key,required this.itemName}) : super(key: key);
 final String itemName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){navigateTo(context, const HomeScreen());}, icon: Icon(Icons.arrow_back,color: Theme.of(context).iconTheme.color,)),
        title: Text(itemName),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal:145,vertical: 100),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            onPressed: () {
              navigateTo(context,const AddingNewItemScreen());
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }
}
/*
  @override
  void initState() {
    super.initState();
    // helper!.allCourses().then((courses){
    //   setState(() {
    //     allCourses = courses;
    //     items = allCourses;
    //   });
    // });
    super.initState();
  }
  /// for filtering text
   void filterSearch(String query) async{
    List dummySearchList = allCourses;
    if(query.isNotEmpty){
      List dummyListDataFiltering = [];
      dummySearchList.forEach((element) {
        var course = Coursel.fromJson(element);
        if(course.name!.toLowerCase().contains(query.toLowerCase())){
          dummyListDataFiltering.add(element);
        }
      });
      setState(() {
        items= [];
        items.addAll(dummyListDataFiltering);
      });
      return;
    }
    else{
      setState(() {
        items = [];
        items = allCourses;
      });
    }
   }
    /// for search
  var searchController = TextEditingController();
  List allCourses = [];
  List items = [];
  /// end of search
 */
