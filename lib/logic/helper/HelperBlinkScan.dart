import 'package:blink_app/db/db.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:objectbox/objectbox.dart';

class HelperBlinkScan{
  ModelBlinkScan? read(){
    return Db.store!.box<ModelBlinkScan>().get(1);
  }

  void deleteAll(){
    Db.store!.box<ModelBlinkScan>().removeAll();
  }

  void putOne(ModelBlinkScan blinkScan){
    Db.store!.box<ModelBlinkScan>().put(blinkScan);
  }

  //only will tigger but stream will not have any value
  Stream listen(){
    return Db.store!.watch<ModelBlinkScan>();
  }
}