

import 'package:flutter/material.dart';

import '../../constatns/colors.dart';

void showBottomModel(BuildContext context){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return  Container(
          height: 200,
          color: screenColor,
          child: Column(
            children:  [
              GestureDetector(
                child: const ListTile(
                  leading:Icon( Icons.camera_alt),
                  title: Text('Take Photo'),
                ),
                onTap: (){},
              ),
              GestureDetector(
                child: const ListTile(
                  leading:Icon( Icons.calendar_view_week_rounded),
                  title: Text('Choose from Gallery'),
                ),
                onTap: (){},
              ),
              GestureDetector(
                child: const ListTile(
                  leading:Icon( Icons.cancel_outlined),
                  title: Text('Cancel'),
                ),
                onTap: (){Navigator.pop(context);},
              ),
            ],
          ),
        );
      }
  );
}

//
// Builder showModalBottomSheet<T>({required BuildContext context,required WidgetBuilder builder,
// Color? backgroundColor,
// double? elevation,}
// )
// {
//   return Builder(builder: (ctx)=>  Center(
//     child: ElevatedButton(
//       child: const Text('Show Modal Bottom Sheet'),
//       onPressed: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return Wrap(
//               children: const [
//                 ListTile(
//                   leading: Icon(Icons.share),
//                   title: Text('Share'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.copy),
//                   title: Text('Copy Link'),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.edit),
//                   title: Text('Edit'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     ),
//   ));
// }