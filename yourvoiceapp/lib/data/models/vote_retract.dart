

class VoteRetract {
  VoteRetract({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  VoteRetract.fromJson(dynamic json) {
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
/// election_contestant_id : 1
/// election_position_id : 4
/// election_id : 7
/// position : "Vice president"
/// vote_count : 7
/// created_at : "2021-06-22T19:32:47.000000Z"
/// updated_at : "2021-07-01T18:50:21.000000Z"

class Data {
  Data({
      int? id, 
      int? electionContestantId, 
      int? electionPositionId, 
      int? electionId, 
      String? position, 
      int? voteCount, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _electionContestantId = electionContestantId;
    _electionPositionId = electionPositionId;
    _electionId = electionId;
    _position = position;
    _voteCount = voteCount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _electionContestantId = json['election_contestant_id'];
    _electionPositionId = json['election_position_id'];
    _electionId = json['election_id'];
    _position = json['position'];
    _voteCount = json['vote_count'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _electionContestantId;
  int? _electionPositionId;
  int? _electionId;
  String? _position;
  int? _voteCount;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get electionContestantId => _electionContestantId;
  int? get electionPositionId => _electionPositionId;
  int? get electionId => _electionId;
  String? get position => _position;
  int? get voteCount => _voteCount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['election_contestant_id'] = _electionContestantId;
    map['election_position_id'] = _electionPositionId;
    map['election_id'] = _electionId;
    map['position'] = _position;
    map['vote_count'] = _voteCount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}