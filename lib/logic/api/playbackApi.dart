import 'dart:convert';

import 'package:blink_app/logic/helper/HelperBlinkScan.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:http/http.dart' as http;

class PlaybackApi{
  Future<void> callCommand(String command) async{
    ModelBlinkScan? blinkScan = HelperBlinkScan().read();
    String host = blinkScan!.address;
    Map<String, String> headers = new Map();
    headers["Authorization"] = 'Bearer ${blinkScan.token}';
    headers["Content-Type"] = "application/json";
    Uri url = Uri.http("$host:5000", "playback");
    http.Response response  = await http.post(
      url,
      headers: headers,
      body: json.encode({
        "command": command
      }),
    );
    print(response.body);
  }
}