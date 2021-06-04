import 'package:blink_app/logic/helper/HelperBlinkScan.dart';
import 'package:blink_app/screens/qrScanner.dart';
import 'package:flutter/material.dart';

class ConnectCard extends StatelessWidget {
  const ConnectCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.computer),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Text(
                        "Connect to last logged"
                      )
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1,
              indent: 16,
              endIndent: 16,
            ),
            Container(
              height: 160,
              child: StreamBuilder<void>(
                stream: HelperBlinkScan().listen(),
                builder: (context, snapshot) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: HelperBlinkScan().readAll().isEmpty? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.connect_without_contact, 
                          size: 80, 
                          color: Colors.black.withOpacity(0.70),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "No saved connection"
                        )
                      ],
                    ):Text("Some connection are saved!"),
                  );
                }
              ),
            ),
            Divider(
              color: Colors.black26,
              height: 1,
              indent: 16,
              endIndent: 16,
            ),
            InkWell(
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QrScanner()));
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.qr_code_2),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Text(
                        "Scan QR Code"
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}