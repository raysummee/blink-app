import 'package:blink_app/db/db.dart';
import 'package:blink_app/logic/models/modelBlinkScan.dart';
import 'package:blink_app/logic/models/modelBlinkScanSaved.dart';
import 'package:blink_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class HelperBlinkScanSaved{
  List<ModelBlinkScanSaved> readAll(){
    return Db.store!.box<ModelBlinkScanSaved>().getAll();
  }

  void deleteAll(){
    Db.store!.box<ModelBlinkScanSaved>().removeAll();
  }

  ModelBlinkScanSaved? latest(){
    Box<ModelBlinkScanSaved> box = Db.store!.box<ModelBlinkScanSaved>();
    final query = box.query(ModelBlinkScanSaved_.updatedOn.between(DateTime.now().subtract(Duration(days: 30)).millisecondsSinceEpoch, DateTime.now().millisecondsSinceEpoch)).build();
    List<ModelBlinkScanSaved> list = query.find();
    query.close();
    return  list.isNotEmpty? list.last: null;
  }

  void putScan(ModelBlinkScan blinkScan){
    Box<ModelBlinkScanSaved> box = Db.store!.box<ModelBlinkScanSaved>();
    final query = box.query(ModelBlinkScanSaved_.machine.equals(blinkScan.machine)).build();
    if(query.count()>0){
      //update
      ModelBlinkScanSaved? blinkScanSaved = query.findFirst();
      query.close();
      print(blinkScanSaved!.id);
      blinkScanSaved.updatedOn = DateTime.now();
      blinkScanSaved.address =  blinkScan.address;
      blinkScanSaved.crashed = false;
      blinkScanSaved.username = blinkScan.username;
      blinkScanSaved.password = blinkScan.password;
      box.put(blinkScanSaved);
    }else{
      //add new
      ModelBlinkScanSaved blinkScanSaved =  ModelBlinkScanSaved(
        machine: blinkScan.machine, 
        address: blinkScan.address, 
        username: blinkScan.username, 
        password: blinkScan.password, 
        createdOn: DateTime.now(), 
        updatedOn: DateTime.now()
      );
      box.put(blinkScanSaved);
    }
  }

  //only will tigger but stream will not have any value
  Stream listen(){
    return Db.store!.watch<ModelBlinkScanSaved>();
  }
}