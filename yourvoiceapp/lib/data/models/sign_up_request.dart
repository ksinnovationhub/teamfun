class SignUpRequestModel {
  String? name;
  String? phone;
  String?  email;
  String?  password;


  SignUpRequestModel({this.email, this.password, this.name,this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name']= name;
    data['phone']= phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}