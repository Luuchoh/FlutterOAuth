import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_oauth/Common/Constant.dart';
import 'package:flutter_oauth/HttpProtocol/Status.dart';
import 'package:flutter_oauth/Widgets/TextMessage.dart';
import 'package:http/http.dart';

typedef VoidCallBackParam(String param);

class HttpExecute {

  String endpoint;
  var parameters;
  HttpExecute({this.endpoint='', this.parameters});

  post() async{
    return await checkConnection(executeMethod, 'post');
  }

  checkConnection(VoidCallBackParam voidCallBackParam, String type) async{
    var connectionResult = await Connectivity().checkConnectivity();
    return (connectionResult == ConnectivityResult.wifi || connectionResult == ConnectivityResult.mobile )
            ? await voidCallBackParam(type)
            : Status(type: CONNECTION_DISABLED, statusWidget: TextMessage('Sin conexión'));
  }

  executeMethod(String type) async{
    Response? response;
    switch(type) {
      case 'post':
        response = await Client().post(
          uri,
          headers: header,
          body: parameters
        );
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

  get header {
    return {
      "content-type": "application/x-www-form-urlencoded"
    };
  }

}