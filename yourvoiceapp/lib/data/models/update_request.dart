class UpdateRequest{
  String? name;
  String? email;

  UpdateRequest({this.name, this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}