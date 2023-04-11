import '../Common/Validate.dart';
import '../HttpProtocol/EndPoint.dart';
import 'Count.dart';

class User {
  int id;
  String userName;
  String name;
  String email;

  User({
    this.id = 0,
    this.userName = '',
    this.name = '',
    this.email = '',
  });

  factory User.toObject(Map<String, Object?> data) {
    Validate validate = Validate(data: data);
    return User(
      id: validate.checkKeyExists(key: 'id', initialize: 0),
      userName: validate.checkKeyExists(key: 'username', initialize: ""),
      name: validate.checkKeyExists(key: 'name', initialize: ""),
      email: validate.checkKeyExists(key: 'email', initialize: ""),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': userName,
      'name': name,
      'email': email,
    };
  }

  getUser(Count count) async{
    var data = await EndPoint.getUser(count);
    print("object $data");
    return Validate(data: data).checkIsStatusOrResponse(saveOrUpdate);
  }

  saveOrUpdate(data) {
    // return User.toObject(data);
  }
}