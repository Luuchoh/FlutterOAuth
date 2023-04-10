import 'package:flutter_oauth/Common/Validate.dart';

class Count {

  int id;
  String accessToken;
  String refreshToken;
  String createdAt;
  String expiresIn;
  String expiresTime;
  String tokenType;

  Count({
    this.id = 0,
    this.refreshToken = '',
    this.accessToken = '',
    this.createdAt = '',
    this.expiresIn = '',
    this.expiresTime = '',
    this.tokenType = '',
  });

  factory Count.toObject(Map<String, Object?> data) {
    Validate validate = Validate(data: data);
    return Count(
      id: validate.checkKeyExists(key: 'id', initialize: 0),
      accessToken: validate.checkKeyExists(key: 'access_token', initialize: ""),
      refreshToken: validate.checkKeyExists(key: 'refresh_token', initialize: ""),
      createdAt: validate.checkKeyExists(key: 'created_at', initialize: ""),
      expiresIn: validate.checkKeyExists(key: 'expires_in', initialize: ""),
      expiresTime: validate.checkKeyExists(key: 'expires_time', initialize: ""),
      tokenType: validate.checkKeyExists(key: 'token_type', initialize: ""),
    );
  }

  Map<String, dynamic> toMap() {
    return {
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'created_at': createdAt,
    'expires_in': expiresIn,
    'expires_time': expiresTime,
    'token_type': tokenType,
    };
  }

}