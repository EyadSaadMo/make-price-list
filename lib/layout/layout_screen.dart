import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:work/core/components/widgets/custom%20container/custom_container_screen.dart';
import 'package:work/core/components/widgets/default_form_field/defaultt_form_field_component.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/modules/add_new_item/add_new_item_screen.dart';
import 'package:work/modules/categories/categories_screen.dart';
import 'package:work/modules/edit_list/test.dart';
import 'package:work/modules/notifications/notifications_screen.dart';
import '../core/components/sqflite/queres_screen.dart';
import '../core/components/widgets/drawer/drawer_screen.dart';
import '../core/components/widgets/routes/routes_screen.dart';
import '../models/search_model.dart';
import '../modules/edit_list/edit_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String barcode = 'unKnown';
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      barcode = barcodeScanRes;
    });
  }

  final drawerKey = GlobalKey<ScaffoldState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var codeController = TextEditingController();

  void shareFileAsPdf() async {
    var file = await FilePicker.platform.pickFiles();
    Share.shareFiles([file!.paths[0].toString()]);
  }

  SqlDatabase sqlDatabase = SqlDatabase();

  bool isLoading = true;

  List newItem = [];

  Future readData() async {
    List<Map> response = await sqlDatabase.read('item');
    newItem.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }
  var allItems = [];
  var filteredList = [];

  @override
  void initState() {
    sqlDatabase.getAllSearch().then((value) {
      setState(() {
        allItems = value;
        filteredList = allItems;
      });
    });
    readData();
    super.initState();
  }

  void filterSearch(String keyWord) {
    var dummySearchList = allItems;
    if(keyWord . isNotEmpty){
      var dummyListData = [];
      dummySearchList.forEach((element) {
        var searchText =  SearchTextModel.fromMap(element) ;
        if(searchText.name!.toLowerCase().contains(keyWord.toLowerCase())){
          dummyListData.add(element);
        }
      });
      setState(() {
        filteredList = [];
        filteredList.addAll(dummyListData);
      });
      return;
    }
    else{
      filteredList=[];
      filteredList=allItems;
    }
   }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('All Item',
                style: Theme.of(context).appBarTheme.titleTextStyle),
            actions: [
              IconButton(
                onPressed: () {
                  if (cubit.closedBottomSheet) {
                    Navigator.pop(context);
                    cubit.closedBottomSheet = false;
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet(
                          (context) => Container(
                            height: 180,
                            color: Theme.of(context)
                                .bottomSheetTheme
                                .backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('SORT BY',
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  GestureDetector(
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.sort_by_alpha_outlined,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      title: Text('Alphabetically',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ),
                                    onTap: () {},
                                  ),
                                  GestureDetector(
                                    child: ListTile(
                                      leading: const Icon(
                                          Icons.price_change_outlined,
                                          color: Colors.deepOrangeAccent),
                                      title: Text('Sale Price',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
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
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (cubit.closedBottomSheet) {
                    Navigator.pop(context);
                    cubit.closedBottomSheet = false;
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) => Container(
                              height: 200,
                              color: Theme.of(context)
                                  .bottomSheetTheme
                                  .backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text('Choose Export File Type',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ),
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
                                                decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              onTap: () {
                                                shareFileAsPdf();
                                              },
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
                                                decoration: const BoxDecoration(
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption),
                                      ),
                                    ),
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
                  color: Theme.of(context).iconTheme.color,
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
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DefaultFormFieldComponent(
                  textInputType: TextInputType.name,
                  controller: codeController,

                  onChange: (value){
                    setState(() {
                      filterSearch(value);
                    });
                  },
                  hintText: 'Search item or category',
                  validator: (value) {
                    return null;
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      scanQR().then((val) {
                        setState(() {
                          codeController.text = barcode;
                        });
                      });
                    },
                    icon:codeController.text==barcode?
                    IconButton(onPressed: (){
                      setState(() {
                        codeController.text.trim();
                      });
                    }, icon:  Icon(Icons.cancel,color: Theme.of(context).iconTheme.color,))
                        :Icon(
                      Icons.document_scanner_outlined,
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .suffixIconColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (ctx, index) {
                    var item = SearchTextModel.fromMap(filteredList[index]);
                    return InkWell(
                      child: Dismissible(
                        key: Key(item.id.toString()),
                        background: Container(
                          color: Colors.red,
                          child: ListTile(
                            title: Text(item.id.toString()),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            sqlDatabase.delete(
                                'item', 'id = ${item.id}');
                          });
                        },
                        child: Card(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text('${item.name}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Size/Weight: ${item.weight}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.grey.shade600,
                                                fontSize: 14)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Quantity : ${item.quantity}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.grey.shade600,
                                                fontSize: 14)),
                                  ],
                                ),
                                trailing: Text(
                                  '${item.salePrice}\$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: AppCubit.get(context).isDark
                                              ? HexColor('808000')
                                              : HexColor('800000')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        scaffoldKey.currentState!.showBottomSheet(
                            (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                color: Theme.of(context)
                                    .bottomSheetTheme
                                    .backgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      color: Theme.of(context).primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Image.asset(
                                                'assets/images/ic_list.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                await Share.share('hello eyed');
                                              },
                                              icon: Icon(
                                                Icons.share_outlined,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (ctx) =>
                                                  //       EditListScreen(
                                                  //       itemName: '${item.name}',
                                                  //       weight:'${item.weight}',
                                                  //       quantity:item.quantity!.toInt(),
                                                  //       costPrice:item.costPrice!.toInt(),
                                                  //       salePrice:item.salePrice!.toInt(),
                                                  //       description:'${item.description}',
                                                  //       code:'${item.code}',
                                                  //       id: item.id!.toInt(),
                                                  // ),
                                                    EditNewScreen(searchTextModel: item)
                                                ));
                                              },
                                              icon: Icon(
                                                Icons.edit_note_outlined,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.rectangle,
                                        border: Border.all(color: Colors.red),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          'assets/images/checkListWomen2.jpg',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${item.name}',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Un Categories',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: Colors.grey.shade600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Size/Weight',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${item.weight}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            color: Colors
                                                                .grey.shade600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'quantity',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${item.quantity}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            color: Colors
                                                                .grey.shade600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'costPrice',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${item.costPrice}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            color: Colors
                                                                .grey.shade600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'SalePrice',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${item.salePrice}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            color: Colors
                                                                .grey.shade600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Description',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${item.description}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            color: Colors
                                                                .grey.shade600),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                            elevation: 0.0);
                      },
                    );
                  },
                ),
              ),
              ////////
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  CustomContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  navigateTo(context, CategoriesScreen());
                                },
                                icon: Icon(
                                  Icons.dataset_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              Text('Categories',
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(
                                height: 55,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  navigateTo(context,const  NotificationsScreen());
                                },
                                icon: Icon(
                                  Icons.notifications,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              Text('Notifications',
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(
                                height: 55,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        navigateTo(context, const AddingNewItemScreen());
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
