import 'dart:io';

import 'package:flutter/material.dart';
import 'package:work/core/components/sqflite/queres_screen.dart';
import 'package:work/core/components/widgets/drawer/drawer_screen.dart';
import 'package:work/layout/layout_screen.dart';

import 'package:work/modules/categories/categories_screen.dart';

import '../../core/components/widgets/default_form_field/defaultt_form_field_component.dart';
import '../../core/components/widgets/routes/routes_screen.dart';


class EditCategoriesScreen extends StatefulWidget {
  final String itemName;
  final int id;
  const EditCategoriesScreen({Key? key, required this.itemName, required this.id}) : super(key: key);

  @override
  State<EditCategoriesScreen> createState() => _EditCategoriesScreenState();
}

class _EditCategoriesScreenState extends State<EditCategoriesScreen> {

  SqlDatabase sqlDatabase = SqlDatabase();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var itemNameController = TextEditingController();
  var idController = TextEditingController();
  @override
  void initState() {
    itemNameController.text = widget.itemName;
    idController.text= widget.id.toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(onPressed: (){navigateTo(context, HomeScreen());}, icon: Icon(Icons.arrow_back)),
            title: Text(
                'Edit Categories',
                style: Theme.of(context).appBarTheme.titleTextStyle),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                            'Category Name',
                            style:Theme.of(context).textTheme.bodyText1),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormFieldComponent(
                          textInputType: TextInputType.name,
                          controller: itemNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'required';
                            }
                            return '';
                          }),
                      const SizedBox(height: 15,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: MaterialButton(
                          onPressed: () async {
                              int response = await sqlDatabase.update('categories',
                                  {
                                    'name' : itemNameController.text,
                                  },
                                  'id=${widget.id}');
                              print(response);
                              if (response > 0) {
                                navigateAndFinish(context, CategoriesScreen());
                              }

                          },
                          color:Theme.of(context).primaryColor,
                          child: Text(
                              'Update',
                              style: Theme.of(context).textTheme.bodyText1),

                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: MaterialButton(
                          onPressed: () async {
                            int response = await sqlDatabase.delete('categories',
                                'id = ${widget.id}' );
                            print(response);
                            if (response > 0) {
                              navigateAndFinish(context, const HomeScreen());
                            }

                          },
                          color:Theme.of(context).primaryColor,
                          child: Text(
                              'DELETE',
                              style: Theme.of(context).textTheme.bodyText1),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
