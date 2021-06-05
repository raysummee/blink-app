import 'dart:convert';

import 'package:blink_app/logic/helper/HelperBlinkScan.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:http/http.dart' as http;

class PlaybackApi{
  Future<void> callCommand(String command) async{
    ModelBlinkScan? blinkScan = HelperBlinkScan().read();
    String host = blinkScan!.address;
    Map<String, String> headers = new Map();
    headers["Authorization"] = 'Basic ${blinkScan.token}';

    Uri url = Uri.parse("$host/playback");
    http.post(
      url,
      headers: headers,
      body: json.encode({
        "command": command
      }),
    );
  }
}