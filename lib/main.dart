import 'package:blink_app/components/Cards/ConnectCard.dart';
import 'package:blink_app/components/texts/GuideTexts.dart';
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
          ConnectCard(),
          GuideTexts()
        ],
      ),
    );
  }

}
