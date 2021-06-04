
import 'package:blink_app/db/db.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:blink_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class HelperBlinkScan{
  List<ModelBlinkScan> readAll(){
    return Db.store!.box<ModelBlinkScan>().getAll();
  }

  void deleteAll(){
    Db.store!.box<ModelBlinkScan>().removeAll();
  }

  //if id == 0, add new, else will update existing
  void putOne(ModelBlinkScan blinkScan){
    Db.store!.box<ModelBlinkScan>().put(blinkScan);
  }

  //only will tigger but stream will not have any value
  Stream listen(){
    return Db.store!.watch<ModelBlinkScan>();
  }
}