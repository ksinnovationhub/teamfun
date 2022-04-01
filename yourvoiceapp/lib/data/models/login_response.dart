

class LoginResponse {
  LoginResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
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
      String? token, 
      String? tokenType,}){
    _user = user;
    _token = token;
    _tokenType = tokenType;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _tokenType = json['token_type'];
  }
  User? _user;
  String? _token;
  String? _tokenType;

  User? get user => _user;
  String? get token => _token;
  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['token_type'] = _tokenType;
    return map;
  }

}



class User {
  User({
      int? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      dynamic phone, 
      String? code, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _phone = phone;
    _code = code;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _phone = json['phone'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  dynamic _phone;
  String? _code;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get phone => _phone;
  String? get code => _code;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['phone'] = _phone;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}