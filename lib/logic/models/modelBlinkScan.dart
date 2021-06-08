import 'package:objectbox/objectbox.dart';

@Entity()
class ModelBlinkScan{
  @Id(assignable: true)
  int id;
  String machine;
  String address;
  String token;
  ModelBlinkScan({required this.id, required this.machine, required this.address, required this.token});

  factory ModelBlinkScan.fromjson(Map<String, dynamic> body){
    return ModelBlinkScan(
      id: 1,
      machine: body.containsKey("machine")?body['machine'].toString():"Machine", 
      address: body.containsKey("address")?body['address'].toString():"", 
      token: body.containsKey("token")?body['token'].toString():"", 
    );
  }
}