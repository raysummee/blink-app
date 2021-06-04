import 'package:objectbox/objectbox.dart';

@Entity()
class ModelBlinkScanSaved{
  int id=0;
  late String machine;
  late String address;
  late String username;
  late String password;
  @Property(type: PropertyType.date)
  late DateTime createdOn;
  @Property(type: PropertyType.date)
  late DateTime updatedOn;
  late bool crashed;

  ModelBlinkScanSaved({
    required this.machine,
    required this.address,
    required this.username,
    required this.password,
    this.crashed:false,
    required this.createdOn,
    required this.updatedOn
  });
}