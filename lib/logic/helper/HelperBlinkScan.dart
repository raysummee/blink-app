
import 'package:blink_app/db/db.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:blink_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class HelperBlinkScan{
  List<ModelBlinkScan> readAll(){
    return Db.store!.box<ModelBlinkScan>().getAll();
  }
}