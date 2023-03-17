class TodoModel {
  TodoModel({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? date,
  }) {
    _id = id;
    _userId = userId;
    _title = title;
    _description = description;
    _date = date;
  }

  TodoModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _title = json['title'];
    _description = json['description'];
    _date = json['date'];
  }
  String? _id;
  String? _userId;
  String? _title;
  String? _description;
  String? _date;
  TodoModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? date,
  }) =>
      TodoModel(
        id: id ?? _id,
        userId: userId ?? _userId,
        title: title ?? _title,
        description: description ?? _description,
        date: date ?? _date,
      );
  String? get id => _id;
  String? get userId => _userId;
  String? get title => _title;
  String? get description => _description;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    return map;
  }
}
