
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:work/core/components/barcode_scan/barcode_scan_screen.dart';
import 'package:work/core/components/widgets/custom%20container/custom_container_screen.dart';
import 'package:work/core/components/widgets/default_form_field/defaultt_form_field_component.dart';
import 'package:work/core/constatns/colors.dart';
import 'package:work/layout/cubit/app_cubit.dart';
import 'package:work/layout/cubit/app_state.dart';
import 'package:work/modules/add_new_item/add_new_item_screen.dart';
import 'package:work/modules/categories/categories_screen.dart';
import 'package:work/modules/notifications/notifications_screen.dart';
import '../core/components/sqflite/queres_screen.dart';
import '../core/components/widgets/drawer/drawer_screen.dart';
import '../core/components/widgets/routes/routes_screen.dart';
import '../modules/edit_list/edit_list_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final drawerKey = GlobalKey<ScaffoldState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var itemNameController = TextEditingController();

  void shareFileAsPdf() async {
    var file = await FilePicker.platform.pickFiles();
    Share.shareFiles([file!.paths[0].toString()]);
  }

  SqlDatabase sqlDatabase = SqlDatabase();

  bool isLoading= true;

  List newItem = [] ;

  Future readData() async {
    List<Map> response = await sqlDatabase.read('item');
    newItem.addAll(response);
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
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
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
                  }else {
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
                  textInputType: TextInputType.text,
                  controller: itemNameController,
                  validator: (value) {
                    return '';
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      navigateTo(context, const BarCodeScannerScreen());
                    },
                    icon: Icon(
                      Icons.document_scanner_outlined,
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .suffixIconColor,
                    ),
                  ),
                  hintText: 'Search item or category',
                ),
              ),
              Expanded(
                child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              child: Dismissible(
                                key:Key(newItem[index]['id'].toString()),
                                background: Container(color: Colors.red ,child: ListTile(
                                  title: Text(newItem[index]['id'].toString()),
                                ),),
                                onDismissed: (direction){
                                 setState(() {
                                   sqlDatabase.delete('item', 'id = ${newItem[index]['id']}');
                                 });
                                },
                                child: Card(
                                  color: Theme.of(context).appBarTheme.backgroundColor,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                          title: Text(
                                              '${newItem[index]['name']}',style: Theme.of(context).textTheme.bodyText1),
                                        subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10,),
                                              Text(
                                                  'Size/Weight: ${newItem[index]['weight']}',style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(color: Colors.grey.shade600,fontSize: 14)),
                                              const SizedBox(height: 10,),
                                              Text(
                                                  'Quantity : ${newItem[index]['quantity']}',style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(color: Colors.grey.shade600,fontSize: 14)),
                                            ],
                                          ),
                                          trailing: Text(
                                              '${newItem[index]['salePrice']}\$',style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                    (context) =>  Container(
                                        height: MediaQuery.of(context).size.height * 0.65,
                                        color: Theme.of(context).bottomSheetTheme.backgroundColor,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 40,
                                              color: Theme.of(context).primaryColor,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                                        color: Theme.of(context).iconTheme.color,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>EditListScreen(
                                                            itemName: newItem[index]['name'],
                                                            weight:  newItem[index]['weight'],
                                                            quantity:  newItem[index]['quantity'],
                                                            costPrice:  newItem[index]['costPrice'],
                                                            salePrice:  newItem[index]['salePrice'],
                                                            description:  newItem[index]['description'],
                                                            code:  newItem[index]['code'],
                                                            id:  newItem[index]['id']
                                                        ),),);
                                                      },
                                                      icon: Icon(
                                                        Icons.edit_note_outlined,
                                                        color: Theme.of(context).iconTheme.color,
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
                                              newItem[index]['name'],
                                              style: Theme.of(context).textTheme.bodyText1,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Un Categories',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(color: Colors.grey.shade600),
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
                                                            style: Theme.of(context).textTheme.bodyText1,
                                                          ),
                                                          const  Spacer(),
                                                          Text(
                                                            newItem[index]!['weight'].toString(),
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(color: Colors.grey.shade600),
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
                                                            style: Theme.of(context).textTheme.bodyText1,
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            newItem[index]!['quantity'].toString(),
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(color: Colors.grey.shade600),
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
                                                            style: Theme.of(context).textTheme.bodyText1,
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                              newItem[index]!['costPrice'].toString(),
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(color: Colors.grey.shade600),
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
                                                            style: Theme.of(context).textTheme.bodyText1,
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            newItem[index]!['salePrice'].toString(),
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(color: Colors.grey.shade600),
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
                                                            style: Theme.of(context).textTheme.bodyText1,
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            newItem[index]!['description'],
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(color: Colors.grey.shade600),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Divider(
                                                        height: 1,
                                                        color: Theme.of(context).primaryColor,
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
                          itemCount: newItem.length,
                ),
              ),
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
                                  navigateTo(context, NotificationsScreen());
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
                        navigateTo(context,const AddingNewItemScreen());
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
