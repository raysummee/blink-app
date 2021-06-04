import 'package:blink_app/logic/helper/HelperBlinkScan.dart';
import 'package:blink_app/screens/qrScanner.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';

class ConnectCard extends StatelessWidget {
  const ConnectCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        child: StreamBuilder<void>(
          stream: HelperBlinkScan().listen(),
          builder: (context, snapshot) {
            return Column(
              children: [
                InkWell(
                  onTap: true? null:(){
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.computer),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            ((){
                              if(HelperBlinkScan().read()!=null){
                                return "Connected to ${HelperBlinkScan().read()!.address}";
                              }
                              return "No connection";
                            }())
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
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: HelperBlinkScan().read() == null? Column(
                      key: ValueKey<int>(0),
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
                          "Scan QR Code to continue"
                        )
                      ],
                    ):
                    Column(
                      key: ValueKey<int>(1),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.connected_tv, 
                          size: 80, 
                          color: Colors.black.withOpacity(0.70),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${HelperBlinkScan().read()!.machine}"
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${HelperBlinkScan().read()!.address}"
                        )
                      ],
                    )
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
                    if(HelperBlinkScan().read() != null){
                      HelperBlinkScan().deleteAll();
                      return;
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>QrScanner()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(HelperBlinkScan().read()==null?Icons.qr_code_2:Icons.signal_wifi_connected_no_internet_4_rounded),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            HelperBlinkScan().read()==null?"Scan QR Code":"Disconnect"
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}