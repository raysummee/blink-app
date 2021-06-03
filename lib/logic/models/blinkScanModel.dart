class BlinkScanModel{
  late String machine;
  late String address;
  late String username;
  late String password;
  BlinkScanModel({required this.machine, required this.address, required this.username, required this.password});

  factory BlinkScanModel.fromjson(Map<String, dynamic> body){
    return BlinkScanModel(
      machine: body.containsKey("machine")?body['machine'].toString():"Machine", 
      address: body.containsKey("address")?body['address'].toString():"", 
      username: body.containsKey("username")?body['username'].toString():"", 
      password: body.containsKey("password")?body['password'].toString():""
    )
  }
}