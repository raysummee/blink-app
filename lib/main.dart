import 'package:blink_app/components/Cards/ConnectCard.dart';
import 'package:blink_app/components/buttons/cardButton.dart';
import 'package:blink_app/components/texts/GuideTexts.dart';
import 'package:blink_app/db/db.dart';
import 'package:blink_app/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Db.init(await getApplicationDocumentsDirectory());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: HomePage(),
    );
  }
  @override
  void dispose() {
    Db.dispose();
    super.dispose();
  }
}