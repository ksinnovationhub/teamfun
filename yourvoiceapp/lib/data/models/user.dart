
class User {
  String? status;
  String? message;
  Data? data;

  User({this.status, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? phone;
  String? code;
  String? photo;
  int? userRole;
  String? createdAt;
  String? updatedAt;

  Data(
      {required this.id,
        required this.name,
        required this.email,
        this.emailVerifiedAt,
        required this.phone,
        required this.code,
        required this.photo,
        required this.userRole,
        required this.createdAt,
        required this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    code = json['code'];
    photo = json['photo'];
    userRole = json['user_role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['code'] = code;
    data['photo'] = photo;
    data['user_role'] = userRole;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}