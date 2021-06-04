import 'dart:io';

import 'package:blink_app/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

class Db{
  static Store? _store;

  static void init(Directory dir){
    _store = Store(getObjectBoxModel(), directory: dir.path + '/blink'); 
  }

  static void dispose(){
    _store!.close();
    _store = null;
  }

  static Store? get store=>_store;
}