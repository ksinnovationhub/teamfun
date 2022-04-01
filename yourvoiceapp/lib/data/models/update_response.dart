/// status : "success"
/// message : "Profile updated successfully"
/// data : {"id":1,"name":"Tino","email":"sixpathdev@gmail.com","email_verified_at":null,"phone":null,"code":null,"photo":null,"created_at":"2021-06-22T13:31:21.000000Z","updated_at":"2021-08-11T06:50:14.000000Z","user_role":"user"}

class UpdateResponse {
  UpdateResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UpdateResponse.fromJson(dynamic json) {
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

/// id : 1
/// name : "Tino"
/// email : "sixpathdev@gmail.com"
/// email_verified_at : null
/// phone : null
/// code : null
/// photo : null
/// created_at : "2021-06-22T13:31:21.000000Z"
/// updated_at : "2021-08-11T06:50:14.000000Z"
/// user_role : "user"

class Data {
  Data({
      int? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      dynamic phone, 
      dynamic code, 
      dynamic photo, 
      String? createdAt, 
      String? updatedAt, 
      String? userRole,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _phone = phone;
    _code = code;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userRole = userRole;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _phone = json['phone'];
    _code = json['code'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userRole = json['user_role'];
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  dynamic _phone;
  dynamic _code;
  dynamic _photo;
  String? _createdAt;
  String? _updatedAt;
  String? _userRole;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get phone => _phone;
  dynamic get code => _code;
  dynamic get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get userRole => _userRole;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['phone'] = _phone;
    map['code'] = _code;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_role'] = _userRole;
    return map;
  }

}