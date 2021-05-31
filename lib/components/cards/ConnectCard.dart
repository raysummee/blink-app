import 'package:flutter/material.dart';

class ConnectCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.settings_system_daydream),
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
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.wifi_sharp, size: 100,),
            ),
            Divider(
              color: Colors.black26,
              height: 1,
              indent: 16,
              endIndent: 16,
            ),
            InkWell(
              onTap: (){},
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