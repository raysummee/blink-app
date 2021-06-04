import 'package:objectbox/objectbox.dart';

@Entity()
class ModelBlinkScan{
  @Id(assignable: true)
  late int id;
  late String machine;
  late String address;
  late String username;
  late String password;
  ModelBlinkScan({required this.id, required this.machine, required this.address, required this.username, required this.password});

  factory ModelBlinkScan.fromjson(Map<String, dynamic> body){
    return ModelBlinkScan(
      id: 1,
      machine: body.containsKey("machine")?body['machine'].toString():"Machine", 
      address: body.containsKey("address")?body['address'].toString():"", 
      username: body.containsKey("username")?body['username'].toString():"", 
      password: body.containsKey("password")?body['password'].toString():""
    );
  }
}