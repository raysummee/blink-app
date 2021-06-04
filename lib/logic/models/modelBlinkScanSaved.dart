import 'package:objectbox/objectbox.dart';

@Entity()
class ModelBlinkScanSaved{
  int id=0;
  late String machine;
  late String address;
  late String username;
  late String password;
  late DateTime createdOn;
  late DateTime updatedOn;
  late bool crashed;

  ModelBlinkScanSaved({
    required this.machine,
    required this.address,
    required this.username,
    required this.password,
    required this.crashed,
    required this.createdOn,
    required this.updatedOn
  });
}