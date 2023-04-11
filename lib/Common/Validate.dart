import 'dart:convert';

import 'package:flutter_oauth/HttpProtocol/HttpExecute.dart';
import 'package:flutter_oauth/HttpProtocol/Status.dart';

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

}