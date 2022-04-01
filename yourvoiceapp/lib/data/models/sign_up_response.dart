

class SignUpResponse {
  SignUpResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SignUpResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;

  String? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}



class Data {
  Data({
      User? user, 
      String? code,}){
    _user = user;
    _code = code;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _code = json['code'];
  }
  User? _user;
  String? _code;

  User? get user => _user;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['code'] = _code;
    return map;
  }

}



class User {
  User({
      String? email, 
      String? name, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _email = email;
    _name = name;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  User.fromJson(dynamic json) {
    _email = json['email'];
    _name = json['name'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _email;
  String? _name;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get email => _email;
  String? get name => _name;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['name'] = _name;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}