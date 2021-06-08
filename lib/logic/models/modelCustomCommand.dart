
import 'package:objectbox/objectbox.dart';

@Entity()
class ModelCustomCommand{
  int id=0;
  String commandName;
  String command;
  @Property(type: PropertyType.date) 
  DateTime createdOn;
  @Property(type: PropertyType.date) 
  DateTime updatedOn;
  bool deleted=false;
  ModelCustomCommand({
    required this.command,
    required this.commandName,
    required this.createdOn,
    required this.updatedOn,
  });
}