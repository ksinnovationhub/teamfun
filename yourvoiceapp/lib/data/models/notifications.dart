

class Notifications {

  String status;
  String message;
  List<Data> data;

	Notifications.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		message = map["message"],
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['status'] = status;
		data['message'] = message;
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
class Data {

	int id;
	int user_id;
	int created_by;
	String title;
	String content;
	int seen;
	String created_at;
	String updated_at;

	Data.fromJsonMap(Map<String, dynamic> map):
				id = map["id"],
				user_id = map["user_id"],
				created_by = map["created_by"],
				title = map["title"],
				content = map["content"],
				seen = map["seen"],
				created_at = map["created_at"],
				updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id'] = id;
		data['user_id'] = user_id;
		data['created_by'] = created_by;
		data['title'] = title;
		data['content'] = content;
		data['seen'] = seen;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
