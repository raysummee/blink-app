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
    if(!box.isEmpty()){
      return box.getAll().last;
    }
    return null;
  }

  void putScan(ModelBlinkScan blinkScan){
    Box<ModelBlinkScanSaved> box = Db.store!.box<ModelBlinkScanSaved>();
    final query = box.query(ModelBlinkScanSaved_.machine.equals(blinkScan.machine)).build();
    if(query.count()>0){
      //update
      ModelBlinkScanSaved? blinkScanSaved = query.findFirst();
      query.close();
      update(blinkScanSaved!, blinkScan);
    }else{
      //add new
      addNew(blinkScan);
    }
  }

  void update(ModelBlinkScanSaved blinkScanSaved, ModelBlinkScan blinkScan){
    Box<ModelBlinkScanSaved> box = Db.store!.box<ModelBlinkScanSaved>();
    blinkScanSaved.updatedOn = DateTime.now();
    blinkScanSaved.address =  blinkScan.address;
    blinkScanSaved.crashed = false;
    blinkScanSaved.token = blinkScan.token;
    box.put(blinkScanSaved);
  }
  
  void addNew(ModelBlinkScan blinkScan){
    Box<ModelBlinkScanSaved> box = Db.store!.box<ModelBlinkScanSaved>();
    ModelBlinkScanSaved blinkScanSaved =  ModelBlinkScanSaved(
      machine: blinkScan.machine, 
      address: blinkScan.address, 
      token: blinkScan.token,
      createdOn: DateTime.now(), 
      updatedOn: DateTime.now()
    );
    box.put(blinkScanSaved);
  }
  //only will tigger but stream will not have any value
  Stream listen(){
    return Db.store!.watch<ModelBlinkScanSaved>();
  }
}