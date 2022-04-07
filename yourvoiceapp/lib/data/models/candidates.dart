



class Candidates {
  Candidates({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Candidates.fromJson(dynamic json) {
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
      List<VicePresident>? vicepresident, 
      List<President>? president, 
      List<String>? electionPositions,}){
    _vicepresident = vicepresident;
    _president = president;
    _electionPositions = electionPositions;
}

  Data.fromJson(dynamic json) {
    if (json['Vice president'] != null) {
      _vicepresident = [];
      json['Vice president'].forEach((v) {
        _vicepresident?.add(VicePresident.fromJson(v));
      });
    }
    if (json['President'] != null) {
      _president = [];
      json['President'].forEach((v) {
        _president?.add(President.fromJson(v));
      });
    }
    _electionPositions = json['election_positions'] != null ? json['election_positions'].cast<String>() : [];
  }
  List<VicePresident>? _vicepresident;
  List<President>? _president;
  List<String>? _electionPositions;

  List<VicePresident>? get vicepresident => _vicepresident;
  List<President>? get president => _president;
  List<String>? get electionPositions => _electionPositions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vicepresident != null) {
      map['Vice president'] = _vicepresident?.map((v) => v.toJson()).toList();
    }
    if (_president != null) {
      map['President'] = _president?.map((v) => v.toJson()).toList();
    }
    map['election_positions'] = _electionPositions;
    return map;
  }

}



class President {
  President({
      int? id, 
      int? positionId, 
      int? electionId, 
      String? name, 
      String? position, 
      String? photo, 
      String? createdAt, 
      String? updatedAt, 
      Vote? vote,}){
    _id = id;
    _positionId = positionId;
    _electionId = electionId;
    _name = name;
    _position = position;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _vote = vote;
}

  President.fromJson(dynamic json) {
    _id = json['id'];
    _positionId = json['position_id'];
    _electionId = json['election_id'];
    _name = json['name'];
    _position = json['position'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _vote = json['vote'] != null ? Vote.fromJson(json['vote']) : null;
  }
  int? _id;
  int? _positionId;
  int? _electionId;
  String? _name;
  String? _position;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;
  Vote? _vote;

  int? get id => _id;
  int? get positionId => _positionId;
  int? get electionId => _electionId;
  String? get name => _name;
  String? get position => _position;
  String? get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Vote? get vote => _vote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['position_id'] = _positionId;
    map['election_id'] = _electionId;
    map['name'] = _name;
    map['position'] = _position;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_vote != null) {
      map['vote'] = _vote?.toJson();
    }
    return map;
  }

}



class Vote {
  Vote({
      int? electionContestantId, 
      int? voteCount,}){
    _electionContestantId = electionContestantId;
    _voteCount = voteCount;
}

  Vote.fromJson(dynamic json) {
    _electionContestantId = json['election_contestant_id'];
    _voteCount = json['vote_count'];
  }
  int? _electionContestantId;
  int? _voteCount;

  int? get electionContestantId => _electionContestantId;
  int? get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['election_contestant_id'] = _electionContestantId;
    map['vote_count'] = _voteCount;
    return map;
  }

}



class VicePresident {
  VicePresident({
      int? id, 
      int? positionId, 
      int? electionId, 
      String? name, 
      String? position, 
      String? photo, 
      String? createdAt, 
      String? updatedAt, 
      Vote? vote,}){
    _id = id;
    _positionId = positionId;
    _electionId = electionId;
    _name = name;
    _position = position;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _vote = vote;
}

  VicePresident.fromJson(dynamic json) {
    _id = json['id'];
    _positionId = json['position_id'];
    _electionId = json['election_id'];
    _name = json['name'];
    _position = json['position'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _vote = json['vote'] != null ? Vote.fromJson(json['vote']) : null;
  }
  int? _id;
  int? _positionId;
  int? _electionId;
  String? _name;
  String? _position;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;
  Vote? _vote;

  int? get id => _id;
  int? get positionId => _positionId;
  int? get electionId => _electionId;
  String? get name => _name;
  String? get position => _position;
  String? get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Vote? get vote => _vote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['position_id'] = _positionId;
    map['election_id'] = _electionId;
    map['name'] = _name;
    map['position'] = _position;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_vote != null) {
      map['vote'] = _vote?.toJson();
    }
    return map;
  }

}


