import 'package:flutter/material.dart';
import 'package:work/core/components/sqflite/queres_screen.dart';
import 'package:work/modules/categories/categories_screen.dart';
import '../../core/components/widgets/default_form_field/defaultt_form_field_component.dart';


class AddNewCategoryScreen extends StatefulWidget {
  const AddNewCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCategoryScreen> createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen> {
  var catNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  SqlDatabase sqlDatabase =SqlDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
            title: Text(
              'Add New Category',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category Name',
                        style:  Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultFormFieldComponent(
                          textInputType: TextInputType.name,
                          controller: catNameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'required';
                            }
                            return '';
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        ' Color',
                        style:  Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 100,
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: MaterialButton(
                          onPressed: () async {
                            int response = await sqlDatabase.insert('categories', {
                              'name':catNameController.text
                        });
                              // int response = await sqlDatabase.insertData(
                              //     '''
                              //    INSERT INTO categories VALUES("${catNameController.text}")
                              //   ''');
                              print(response);
                              if (response > 0) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (ctx) => CategoriesScreen()), (
                                    route) => false);
                              }


                          },
                          color:Theme.of(context).primaryColor,
                          child: Text(
                              'SAVE',
                              style: Theme.of(context).textTheme.bodyText1),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
