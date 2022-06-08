import 'package:blink_app/components/Cards/ConnectCard.dart';
import 'package:blink_app/components/buttons/cardButton.dart';
import 'package:blink_app/components/texts/GuideTexts.dart';
import 'package:blink_app/db/db.dart';
import 'package:blink_app/logic/helper/HelperBlinkScanSave.dart';
import 'package:blink_app/logic/helper/HelperCustomCommand.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:blink_app/logic/models/modelCustomCommand.dart';
import 'package:blink_app/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/helper/HelperBlinkScan.dart';


late GlobalKey<NavigatorState> navigatorKey;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  navigatorKey = new GlobalKey<NavigatorState>();
  Db.init(await getApplicationDocumentsDirectory());
  // HelperBlinkScanSaved().deleteAll();
  // HelperCustomCommand().addNew(ModelCustomCommand(command: "pause_play", commandName: "Play", createdOn: DateTime.now(), updatedOn: DateTime.now()));
  // HelperBlinkScanSaved().addNew(ModelBlinkScan(id: 0, machine: "machine", address: "192.168.1.6", token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYyMzE0MDg3NywianRpIjoiMjE0ZmRmY2UtMGE1MC00NGQzLWFkNGUtZTM5NzQ1ZGYyYzM0IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6InVzZXJuYW1lIiwibmJmIjoxNjIzMTQwODc3LCJleHAiOjE2MjMxNDE3Nzd9.8wQF_hL5UfyOpQhMK5yEM6xXPqqWZMbLzNf_OZ5sa4M"));
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