import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/modules/qr_scan/scan_screen.dart';

import '../../core/components/widgets/default_form_field/defaultt_form_field_component.dart';
import '../../core/components/widgets/routes/routes_screen.dart';


class AddingNewItemScreen extends StatefulWidget {
  AddingNewItemScreen({Key? key}) : super(key: key);

  @override
  State<AddingNewItemScreen> createState() => _AddingNewItemScreenState();
}

class _AddingNewItemScreenState extends State<AddingNewItemScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var itemNameController = TextEditingController();

  var weightController = TextEditingController();

  var quantityController = TextEditingController();

  var costPriceController = TextEditingController();

  var salePriceController = TextEditingController();

  var descriptionController = TextEditingController();

  var codeController = TextEditingController();
bool selectedPhoto = false;
var oldPhoto = 'assets/images/checkList.jpg';
var newPhoto= '';
File? image;
 Future pickImage(ImageSource source) async {
   try{
     final image = await ImagePicker().pickImage(source: source);
     if(image==null) return;
     final imageTemporary = File(image.path);
     setState(() {
       this.image = imageTemporary;
     });
   }on PlatformException catch(error){
     print('Failed to pick image $error');
   }
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createItemsInDataBase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                'Add New Item',
                style: Theme.of(context).appBarTheme.titleTextStyle),
            ),
            body: ListView(
              children: [
                GestureDetector(
                  child:image != null?Image.file(image!,height: 250,fit: BoxFit.cover,): Image.asset(oldPhoto),
                  onTap: () {
                    if (cubit.closedBottomSheet) {
                      Navigator.pop(context);
                      cubit.closedBottomSheet = false;
                    } else {
                      scaffoldKey.currentState!
                          .showBottomSheet((context) => Container(
                                height: 200,
                                color:  Theme.of(context).bottomSheetTheme.backgroundColor,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child:  ListTile(
                                        leading: Icon(Icons.camera_alt_outlined,color:  Theme.of(context).iconTheme.color,),
                                        title: Text('Take Photo',style: Theme.of(context).textTheme.bodyText1),
                                      ),
                                      onTap: () {
                                        pickImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    GestureDetector(
                                      child:  ListTile(
                                        leading: Icon(
                                            Icons.image_outlined,color:  Theme.of(context).iconTheme.color),
                                        title: Text('Choose from Gallery',style: Theme.of(context).textTheme.bodyText1),
                                      ),
                                      onTap: () {
                                        pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    GestureDetector(
                                      child:  ListTile(
                                        leading: Icon(Icons.cancel_outlined,color:  Theme.of(context).iconTheme.color),
                                        title: Text('Cancel',style: Theme.of(context).textTheme.bodyText1),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ))
                          .closed
                          .then((value) {
                        cubit.closedBottomSheet = false;
                      });
                      cubit.closedBottomSheet = true;
                    }
                  },
                ),
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
                            'Category',
                            style: Theme.of(context).textTheme.caption),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).inputDecorationTheme.fillColor,
                          ),
                          child: Row(
                              children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    underline: SizedBox(),
                                       value: AppCubit.get(context).dropDownValue,
                                       icon:  Icon(Icons.keyboard_arrow_down,color: Theme.of(context).iconTheme.color),
                                       // Array list of items
                                    isExpanded: true,
                                       style:  Theme.of(context).textTheme.bodyText1,
                                       dropdownColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                                       isDense: true,
                                       items: AppCubit.get(context).items.map((String items) {
                                         return DropdownMenuItem(
                                           value: items,
                                           child: Text(items,style: Theme.of(context).textTheme.bodyText1,),
                                         );
                                       }).toList(),
                                       onChanged: ( newValue) {
                                         setState(() {
                                           AppCubit.get(context). dropDownValue = newValue! as String;
                                         });
                                       },
                                     ),
                                ),
                              ),
                            ),]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Item Name',
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
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Size/Weight',
                            style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DefaultFormFieldComponent(
                          textInputType: TextInputType.number,
                          controller: weightController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Text(
                              'Optional',
                              style:Theme.of(context).textTheme.caption),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Quantity',
                            style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DefaultFormFieldComponent(
                          textInputType: TextInputType.number,
                          controller: quantityController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Text(
                              'Optional',
                              style: Theme.of(context).textTheme.caption),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                'Cost Price (\$)',
                                style:
                                Theme.of(context).textTheme.bodyText1),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                'Sale Price (\$)',
                                style:
                                Theme.of(context).textTheme.bodyText1),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultFormFieldComponent(
                                textInputType: TextInputType.number,
                                controller: costPriceController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: DefaultFormFieldComponent(
                                textInputType: TextInputType.number,
                                controller: salePriceController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Description',
                            style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DefaultFormFieldComponent(
                          textInputType: TextInputType.name,
                          controller: descriptionController,
                          validator: (value) {
                            return null;
                          },
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Text(
                              'Optional',
                              style: Theme.of(context).textTheme.caption),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'UPC Code',
                            style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: DefaultFormFieldComponent(
                                textInputType: TextInputType.name,
                                controller: codeController,
                                validator: (value) {
                                  return null;
                                },
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: Text(
                                    'Optional',
                                    style:Theme.of(context).textTheme.caption),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).inputDecorationTheme.fillColor,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    navigateTo(context, const ScanScreen());
                                  },
                                  icon:  Icon(
                                      Icons.qr_code_scanner_outlined,color:Theme.of(context).iconTheme.color ,),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Enter UPC Code or tap the scan button holding your device over a Barcode or QR to get UPC Code',
                          style: Theme.of(context).textTheme.caption),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.insertRecordInDatabase(
                                      name: itemNameController.text,
                                      weight: int.parse(weightController.text),
                                      quantity:
                                          int.parse(quantityController.text),
                                      costPrice: double.parse(
                                          costPriceController.text),
                                      salePrice: double.parse(
                                          salePriceController.text),
                                      description: descriptionController.text,
                                      code: codeController.text);

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
              ],
            ),
          );
        },
      ),
    );
  }
}
