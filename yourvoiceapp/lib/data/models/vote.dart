

class Vote {
  Vote({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Vote.fromJson(dynamic json) {
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
      int? votesCasted, 
      List<Voters>? voters, 
      String? electionStartDate, 
      String? electionEndDate, 
      String? timezone, 
      List<ElectionCandidates>? electionCandidates,}){
    _votesCasted = votesCasted;
    _voters = voters;
    _electionStartDate = electionStartDate;
    _electionEndDate = electionEndDate;
    _timezone = timezone;
    _electionCandidates = electionCandidates;
}

  Data.fromJson(dynamic json) {
    _votesCasted = json['votes_casted'];
    if (json['voters'] != null) {
      _voters = [];
      json['voters'].forEach((v) {
        _voters?.add(Voters.fromJson(v));
      });
    }
    _electionStartDate = json['election_start_date'];
    _electionEndDate = json['election_end_date'];
    _timezone = json['timezone'];
    if (json['election_candidates'] != null) {
      _electionCandidates = [];
      json['election_candidates'].forEach((v) {
        _electionCandidates?.add(ElectionCandidates.fromJson(v));
      });
    }
  }
  int? _votesCasted;
  List<Voters>? _voters;
  String? _electionStartDate;
  String? _electionEndDate;
  String? _timezone;
  List<ElectionCandidates>? _electionCandidates;

  int? get votesCasted => _votesCasted;
  List<Voters>? get voters => _voters;
  String? get electionStartDate => _electionStartDate;
  String? get electionEndDate => _electionEndDate;
  String? get timezone => _timezone;
  List<ElectionCandidates>? get electionCandidates => _electionCandidates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['votes_casted'] = _votesCasted;
    if (_voters != null) {
      map['voters'] = _voters?.map((v) => v.toJson()).toList();
    }
    map['election_start_date'] = _electionStartDate;
    map['election_end_date'] = _electionEndDate;
    map['timezone'] = _timezone;
    if (_electionCandidates != null) {
      map['election_candidates'] = _electionCandidates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// position_id : 4
/// election_id : 7
/// name : "Tino"
/// position : "Vice president"
/// photo : "http://127.0.0.1:8000/storage/contestantPhotos/Screenshot-2021-06-15-at-7.25.01-PM_1624377494.png"
/// created_at : "2021-06-22T15:58:14.000000Z"
/// updated_at : "2021-06-22T15:58:14.000000Z"

class ElectionCandidates {
  ElectionCandidates({
      int? id, 
      int? positionId, 
      int? electionId, 
      String? name, 
      String? position, 
      String? photo, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _positionId = positionId;
    _electionId = electionId;
    _name = name;
    _position = position;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ElectionCandidates.fromJson(dynamic json) {
    _id = json['id'];
    _positionId = json['position_id'];
    _electionId = json['election_id'];
    _name = json['name'];
    _position = json['position'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _positionId;
  int? _electionId;
  String? _name;
  String? _position;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get positionId => _positionId;
  int? get electionId => _electionId;
  String? get name => _name;
  String? get position => _position;
  String? get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

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
    return map;
  }

}

/// id : 1
/// user_id : 9
/// election_id : 7
/// status : "pending"
/// name : "mimi"
/// created_at : "2021-06-22T17:51:49.000000Z"
/// updated_at : "2021-06-22T17:51:49.000000Z"

class Voters {
  Voters({
      int? id, 
      int? userId, 
      int? electionId, 
      String? status, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _electionId = electionId;
    _status = status;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Voters.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _electionId = json['election_id'];
    _status = json['status'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  int? _electionId;
  String? _status;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  int? get electionId => _electionId;
  String? get status => _status;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['election_id'] = _electionId;
    map['status'] = _status;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}