// ignore_for_file: unnecessary_getters_setters, dead_code

class NotificationDataModel {
  String? _id;
  String? _type;
  String? _notifiableType;
  int? _notifiableId;
  Data? _data;
  Null _readAt;
  String? _createdAt;
  String? _updatedAt;

  NotificationDataModel(
      {String? id,
      String? type,
      String? notifiableType,
      int? notifiableId,
      Data? data,
      Null readAt,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (type != null) {
      _type = type;
    }
    if (notifiableType != null) {
      _notifiableType = notifiableType;
    }
    if (notifiableId != null) {
      _notifiableId = notifiableId;
    }
    if (data != null) {
      _data = data;
    }
    if (readAt != null) {
      _readAt = readAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get notifiableType => _notifiableType;
  set notifiableType(String? notifiableType) =>
      _notifiableType = notifiableType;
  int? get notifiableId => _notifiableId;
  set notifiableId(int? notifiableId) => _notifiableId = notifiableId;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  Null get readAt => _readAt;
  set readAt(Null readAt) => _readAt = readAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  NotificationDataModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _type = json['type'];
    _notifiableType = json['notifiable_type'];
    _notifiableId = json['notifiable_id'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _readAt = json['read_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['type'] = _type;
    data['notifiable_type'] = _notifiableType;
    data['notifiable_id'] = _notifiableId;
    if (_data != null) {
      data['data'] = _data!.toJson();
    }
    data['read_at'] = _readAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class Data {
  String? _body;
  String? _link;

  Data({String? body, String? link}) {
    if (body != null) {
      _body = body;
    }
    if (link != null) {
      _link = link;
    }
  }

  String? get body => _body;
  set body(String? body) => _body = body;
  String? get link => _link;
  set link(String? link) => _link = link;

  Data.fromJson(Map<String, dynamic> json) {
    _body = json['body'];
    _link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = _body;
    data['link'] = _link;
    return data;
  }
}
