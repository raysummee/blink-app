import 'package:objectbox/objectbox.dart';

@Entity()
class ModelBlinkScanSaved{
  int id=0;
  String machine;
  String address;
  String token;
  @Property(type: PropertyType.date)
  DateTime createdOn;
  @Property(type: PropertyType.date)
  DateTime updatedOn;
  bool crashed;

  ModelBlinkScanSaved({
    required this.machine,
    required this.address,
    required this.token,
    this.crashed:false,
    required this.createdOn,
    required this.updatedOn
  });
}