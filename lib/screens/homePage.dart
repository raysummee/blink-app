import 'package:blink_app/components/buttons/cardButton.dart';
import 'package:blink_app/components/cards/ConnectCard.dart';
import 'package:blink_app/components/texts/GuideTexts.dart';
import 'package:blink_app/logic/helper/HelperBlinkScan.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

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
          ConnectCard(),
          CardButton(
            label: "Settings",
            icon: Icons.settings,
            func: (){},
          ),
          StreamBuilder<void>(
            stream: HelperBlinkScan().listen(),
            builder: (context, snapshot) {
              return CardButton(
                label: "Controller",
                icon: Icons.gamepad_outlined,
                func: HelperBlinkScan().read()!=null?(){}:null,
              );
            }
          ),
          SizedBox(height:8,),
          GuideTexts(),
        ],
      ),
    );
  }
}
