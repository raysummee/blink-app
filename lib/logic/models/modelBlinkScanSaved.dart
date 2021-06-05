import 'package:objectbox/objectbox.dart';

@Entity()
class ModelBlinkScanSaved{
  int id=0;
  late String machine;
  late String address;
  late String token;
  @Property(type: PropertyType.date)
  late DateTime createdOn;
  @Property(type: PropertyType.date)
  late DateTime updatedOn;
  late bool crashed;

  ModelBlinkScanSaved({
    required this.machine,
    required this.address,
    required this.token,
    this.crashed:false,
    required this.createdOn,
    required this.updatedOn
  });
}