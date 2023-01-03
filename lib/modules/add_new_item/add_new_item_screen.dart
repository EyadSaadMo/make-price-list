import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/core/components/default_form_field/defaultt_form_field_component.dart';
import 'package:work/core/components/routes/routes_screen.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/layout/layout_screen.dart';
import 'package:work/modules/qr_scan/scan_screen.dart';


class AddingNewItemScreen extends StatelessWidget {
  AddingNewItemScreen({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var itemNameController = TextEditingController();
  var weightController = TextEditingController();
  var quantityController = TextEditingController();
  var costPriceController = TextEditingController();
  var salePriceController = TextEditingController();
  var descriptionController = TextEditingController();
  var codeController = TextEditingController();

  chooseFromGallery() async {
    var photo = await ImagePicker().getImage(source: ImageSource.gallery);
    return photo;
  }

  takePhoto() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    return image;
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
            backgroundColor: screenColor,
            appBar: AppBar(
              backgroundColor: defaultColor,
              iconTheme: IconThemeData(color: textColor),
              title: Text(
                'Add New Item',
                style: TextStyle(color: textColor),
              ),
            ),
            body: ListView(
              children: [
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/images/heart.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {
                    if (cubit.closedBottomSheet) {
                      Navigator.pop(context);
                      cubit.closedBottomSheet = false;
                    } else {
                      scaffoldKey.currentState!
                          .showBottomSheet((context) => Container(
                                height: 200,
                                color: screenColor,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      child: const ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text('Take Photo'),
                                      ),
                                      onTap: () {
                                        takePhoto();
                                      },
                                    ),
                                    GestureDetector(
                                      child: const ListTile(
                                        leading: Icon(
                                            Icons.calendar_view_week_rounded),
                                        title: Text('Choose from Gallery'),
                                      ),
                                      onTap: () {
                                        chooseFromGallery();
                                      },
                                    ),
                                    GestureDetector(
                                      child: const ListTile(
                                        leading: Icon(Icons.cancel_outlined),
                                        title: Text('Cancel'),
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
                            style: TextStyle(
                                color: textColor.withOpacity(0.4),
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: defaultColor,
                          ),
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(
                                'Add New Item',
                                style: TextStyle(color: textColor),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: textColor,
                                )),
                          ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Item Name',
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
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
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
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
                              style: TextStyle(color: textColor, fontSize: 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Quantity',
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
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
                              style: TextStyle(color: textColor, fontSize: 10),
                            ),
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
                                'Cost Price ()',
                                style:
                                    TextStyle(color: textColor, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: Text(
                                'Sale Price ()',
                                style:
                                    TextStyle(color: textColor, fontSize: 14),
                              ),
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
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
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
                              style: TextStyle(color: textColor, fontSize: 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'UPC Code',
                            style: TextStyle(color: textColor, fontSize: 14),
                          ),
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
                                    style: TextStyle(
                                        color: textColor, fontSize: 10),
                                  ),
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
                                  color: defaultColor,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    navigateTo(context, const ScanScreen());
                                  },
                                  icon: const Icon(
                                      Icons.qr_code_scanner_outlined),
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
                          style: TextStyle(
                              color: textColor.withOpacity(0.7), fontSize: 14),
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
                              color: Colors.deepOrangeAccent,
                              child: Text(
                                'SAVE',
                                style: TextStyle(color: textColor),
                              ),
                            )),
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
