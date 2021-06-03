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
                        "Connect to PC"
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Icon(Icons.connect_without_contact, size: 80, color: Colors.black.withOpacity(0.70),),
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