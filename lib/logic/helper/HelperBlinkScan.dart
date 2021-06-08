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
    if(blinkScan.address.isEmpty) return;
    if(blinkScan.machine.isEmpty) return;
    if(blinkScan.token.isEmpty) return;
    Db.store!.box<ModelBlinkScan>().put(blinkScan);
  }

  //only will tigger but stream will not have any value
  Stream listen(){
    return Db.store!.watch<ModelBlinkScan>();
  }
}