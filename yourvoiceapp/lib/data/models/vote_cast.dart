

class VoteCast {
  VoteCast({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  VoteCast.fromJson(dynamic json) {
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

/// election_contestant_id : "1"
/// election_position_id : 4
/// election_id : "7"
/// position : "Vice president"
/// vote_count : 1
/// updated_at : "2021-07-01T16:23:10.000000Z"
/// created_at : "2021-07-01T16:23:10.000000Z"
/// id : 3

class Data {
  Data({
      String? electionContestantId, 
      int? electionPositionId, 
      String? electionId, 
      String? position, 
      int? voteCount, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _electionContestantId = electionContestantId;
    _electionPositionId = electionPositionId;
    _electionId = electionId;
    _position = position;
    _voteCount = voteCount;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _electionContestantId = json['election_contestant_id'];
    _electionPositionId = json['election_position_id'];
    _electionId = json['election_id'];
    _position = json['position'];
    _voteCount = json['vote_count'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _electionContestantId;
  int? _electionPositionId;
  String? _electionId;
  String? _position;
  int? _voteCount;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get electionContestantId => _electionContestantId;
  int? get electionPositionId => _electionPositionId;
  String? get electionId => _electionId;
  String? get position => _position;
  int? get voteCount => _voteCount;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['election_contestant_id'] = _electionContestantId;
    map['election_position_id'] = _electionPositionId;
    map['election_id'] = _electionId;
    map['position'] = _position;
    map['vote_count'] = _voteCount;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}