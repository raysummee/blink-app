import 'package:blink_app/components/Cards/ConnectCard.dart';
import 'package:blink_app/components/buttons/cardButton.dart';
import 'package:blink_app/components/texts/GuideTexts.dart';
import 'package:blink_app/db/db.dart';
import 'package:blink_app/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/helper/HelperBlinkScan.dart';


late GlobalKey<NavigatorState> navigatorKey;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  navigatorKey = new GlobalKey<NavigatorState>();
  Db.init(await getApplicationDocumentsDirectory());
  HelperBlinkScan().deleteAll();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blink',
      navigatorKey: navigatorKey,
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