import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blink',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 1
        )
      ),
      home: Blink(),
    );
  }
}

class Blink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blink"
        ),
      ),
      body: Column(
        children: [
          Card(
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(33, 16, 33, 16),
            child: Row(
              children: [
                Icon(Icons.qr_code_2, size: 40,),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "To setup blink system"
                        ),
                        TextSpan(
                          text: "\n1. Download and run blink service on the host"
                        ),
                        TextSpan(
                          text: "\n2. A browser window should open automatically. If not navigate to 'localhost:5000'"
                        ),
                        TextSpan(
                          text: "\n3. Scan the qr code displayed on the browser window with this app"
                        ),
                      ]
                    )
                  ),
                )
              ],
              
            ),
          )
        ],
      ),
    );
  }

}
