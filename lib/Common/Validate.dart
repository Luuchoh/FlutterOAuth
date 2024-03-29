import 'dart:convert';

import 'package:flutter_oauth/HttpProtocol/HttpExecute.dart';
import 'package:flutter_oauth/HttpProtocol/Status.dart';
import 'package:flutter_oauth/Model/Count.dart';
import 'package:flutter_oauth/Model/User.dart';
import 'package:http/http.dart';

class Validate {

  var data;

  Validate({this.data});

  checkKeyExists({String key = "", var initialize}) {
    return (data.containsKey(key) && data[key] != null)
            ? data[key]
            : initialize;
  }

  checkIsStatusOrResponse(VoidCallBackParam method) {
    return (data is Status)
            ? data
            : method(json.decode(data));
  }

  static bool isNotStatus(data) {
    return(data != null && data is !Status);
  }

  static bool isWrongEmailPassword(Response? response) {
    return response!.statusCode == 403;
  }

  static deleteUserAndCount(Count? count, User? user) async{
    if(count != null) {
      if(await count.delete(count.id) && user != null){
        if(await user.delete(user.id)) {
          count = null;
          user = null;
        }
      }
    }

    return (count == null && user == null);
  }

}