import 'package:flutter_oauth/Common/Constant.dart';
import 'package:flutter_oauth/HttpProtocol/HttpExecute.dart';

class EndPoint {

  EndPoint();

  static login(String email, String password){
    Map parameters = {
      GRANT_TYPE: 'password',
      USERNAME: email,
      PASSWORD: password,
      AUDIENCE: URL + API,
      SCOPE: 'read:sample',
      CLIENT_ID: APP_ID,
      CLIENT_SECRET: APP_SECRET,
    };

    return HttpExecute(endpoint: '/oauth/token', parameters: parameters).post();
  }
}