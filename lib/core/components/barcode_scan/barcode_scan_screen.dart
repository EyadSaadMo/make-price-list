import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarCodeScannerScreen extends StatefulWidget {
  const BarCodeScannerScreen({super.key});

  @override
  BarCodeScannerScreenState createState() => BarCodeScannerScreenState();
}

class BarCodeScannerScreenState extends State<BarCodeScannerScreen> {
  String scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Future<void> startBarcodeScanStream() async {
  //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //       '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
  //       .listen((barcode) => print(barcode));
  // }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> scanBarcodeNormal() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
          child: Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ElevatedButton(
                    //     onPressed: () => scanBarcodeNormal(),
                    //
                    //     child: const Text('Start barcode scan')),
                    InkWell(
                      onTap: scanQR,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Start barcode Scan',style:TextStyle(color: Theme.of(context).appBarTheme.backgroundColor,fontSize: 18)),
                            const SizedBox(width: 15,),
                            Icon(Icons.qr_code_scanner_outlined,color: Theme.of(context).appBarTheme.backgroundColor,),
                          ],
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed: () => startBarcodeScanStream(),
                    //     child: const Text('Start barcode scan stream')),
                    const SizedBox(height: 15,),
                    Text('Scan result : $scanBarcode\n',
                        style: const TextStyle(fontSize: 20)),
                  ]),),
        );
      }),
    );
  }
}
