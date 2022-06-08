import 'dart:convert';
import 'dart:io';

import 'package:blink_app/logic/helper/HelperBlinkScan.dart';
import 'package:blink_app/logic/helper/HelperBlinkScanSave.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner
  ({ Key? key }) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  ModelBlinkScan? blinkScan;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
  }
   void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData.code==null)return;
      if(!scanData.code!.contains("address")) return;
      if(!scanData.code!.contains("machine")) return;
      if(!scanData.code!.contains("token")) return;
      setState(() {
        blinkScan =  ModelBlinkScan.fromjson(json.decode(scanData.code!));
      });
    });     
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan QR Code"
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                  borderRadius: 10,
                  borderColor: Colors.white,
                  overlayColor: blinkScan==null?const Color.fromRGBO(0, 0, 0, 80): Colors.green.withOpacity(0.8)
                ),
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(33,16,33,8),
              child: Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(400, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onPressed: blinkScan == null?null:(){
                      HelperBlinkScanSaved().putScan(blinkScan!);
                      HelperBlinkScan().putOne(blinkScan!);
                      Navigator.of(context).pop();
                    },
                    child: Text("Continue"),
                  ),
                  SizedBox(height: 16,),
                  Text(
                    blinkScan == null?
                    'Scan the QR code':
                    "Connect to ${blinkScan!.machine}"
                  ),
                  SizedBox(height: 8,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}