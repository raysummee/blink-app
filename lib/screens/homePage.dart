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
          CardButton(
            label: "Controller",
            icon: Icons.gamepad_outlined,
            func: (){},
          ),
          SizedBox(height:8,),
          GuideTexts(),
        ],
      ),
    );
  }
}
