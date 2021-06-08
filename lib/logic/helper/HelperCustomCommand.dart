import 'package:blink_app/db/db.dart';
import 'package:blink_app/logic/models/modelCustomCommand.dart';
import 'package:blink_app/objectbox.g.dart';

class HelperCustomCommand{
  Stream listen(){
    return Db.store!.watch<ModelCustomCommand>();
  }

  void addNew(ModelCustomCommand customCommand){
    Box box = Db.store!.box<ModelCustomCommand>();
    box.put(customCommand);
  }

  void remove(int id){
    Box box = Db.store!.box<ModelCustomCommand>();
    box.remove(id);
  }

  List<ModelCustomCommand>? getAll(){
    Box<ModelCustomCommand> box = Db.store!.box<ModelCustomCommand>();
    return box.getAll();
  }

}