import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/components/widgets/default_form_field/defaultt_form_field_component.dart';
import '../../core/constatns/colors.dart';
import '../../layout/cubit/app_cubit.dart';
import '../../layout/cubit/app_state.dart';

class AddNewCategoryScreen extends StatelessWidget {
  AddNewCategoryScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
             appBar: AppBar(
              title: Text(
                'Add New Category',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            body: Padding(
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
                          controller: nameController,
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
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.insertInDatabase(
                                    itemName: itemController.text);
                                cubit.getDataFromDatabase2(cubit.database).then((
                                    value) {
                                  Navigator.pop(context);
                                  cubit.unCategoriesList = value;
                                  print(cubit.unCategoriesList);
                                });


                                cubit.closedBottomSheet = false;
                              }
                            },
                            color:  Theme.of(context).primaryColor,
                            child: Text(
                              'SAVE',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
