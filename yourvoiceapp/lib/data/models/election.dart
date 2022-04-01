class Election {

  String status;
  String message;
  Data data;

  Election.fromJsonMap(Map<String, dynamic> map):
        status = map["status"],
        message = map["message"],
        data = Data.fromJsonMap(map["data"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data == null ? null : this.data.toJson();
    return data;
  }
}

class Data {

  List<String> positions;
  List<Contestants> contestants;

  Data.fromJsonMap(Map<String, dynamic> map):
        positions = List<String>.from(map["positions"]),
        contestants = List<Contestants>.from(map["contestants"].map((it) => Contestants.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['positions'] = positions;
    data['contestants'] = contestants != null ?
    this.contestants.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
class Contestants {

  int id;
  int position_id;
  int election_id;
  String name;
  String position;
  String photo;
  String created_at;
  String updated_at;

  Contestants.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        position_id = map["position_id"],
        election_id = map["election_id"],
        name = map["name"],
        position = map["position"],
        photo = map["photo"],
        created_at = map["created_at"],
        updated_at = map["updated_at"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['position_id'] = position_id;
    data['election_id'] = election_id;
    data['name'] = name;
    data['position'] = position;
    data['photo'] = photo;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}
