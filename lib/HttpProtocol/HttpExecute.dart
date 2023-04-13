import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_oauth/Common/Constant.dart';
import 'package:flutter_oauth/HttpProtocol/Status.dart';
import 'package:flutter_oauth/Widgets/TextMessage.dart';
import 'package:http/http.dart';

import '../Model/Count.dart';

typedef VoidCallBackParam(var param);

class HttpExecute {

  String endpoint;
  var parameters;
  Count? count;

  HttpExecute({this.endpoint='', this.parameters});

  post() async{
    return await checkConnection(executeMethod, 'post');
  }

  get() async{
    return await checkConnection(executeMethod, 'get');
  }

  checkConnection(VoidCallBackParam voidCallBackParam, String type) async{
    var connectionResult = await Connectivity().checkConnectivity();
    return (connectionResult == ConnectivityResult.wifi || connectionResult == ConnectivityResult.mobile )
            ? await voidCallBackParam(type)
            : Status(type: CONNECTION_DISABLED, statusWidget: TextMessage('Sin conexión'));
  }

  executeMethod(var type) async{
    Response? response;
    count = await Count().getCount();
    switch(type) {
      case 'post':
        response = await Client().post(
          uri,
          headers: header,
          body: parameters
        );
        break;
      case 'get':
        response = await Client().get(
            uri,
            headers: header,
        );
        print('respuesta get ${response.body}');
        break;
    }
    return validateResponse(response);
  }

  validateResponse(Response? response) {
    return(response!.statusCode >= 200 && response!.statusCode <=300)
            ? response.body
            : Status(
                type: SERVER_ERROR,
                response: response,
                statusWidget: TextMessage('Error en el servidor ' + response.statusCode.toString())
              );
  }
  
  get uri {
    return Uri.parse(URL + endpoint);
  }

  Map<String, String>? get header {
    return {
      "content-type": "application/x-www-form-urlencoded",
      "Authorization": count != null ? authorization : ''
    };
  }

  get authorization {
    return "${count!.tokenType} ${count!.accessToken}";
  }

}