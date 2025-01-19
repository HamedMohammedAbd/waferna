// ignore_for_file: unnecessary_getters_setters, dead_code

class WaitingListProductModel {
  int? _id;
  int? _categoryId;
  int? _userId;
  Null _providerId;
  String? _name;
  String? _status;
  String? _description;
  int? _dayCount;
  String? _endDate;
  String? _createdAt;
  String? _updatedAt;

  WaitingListProductModel(
      {int? id,
      int? categoryId,
      int? userId,
      Null providerId,
      String? name,
      String? status,
      String? description,
      int? dayCount,
      String? endDate,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (providerId != null) {
      _providerId = providerId;
    }
    if (name != null) {
      _name = name;
    }
    if (status != null) {
      _status = status;
    }
    if (description != null) {
      _description = description;
    }
    if (dayCount != null) {
      _dayCount = dayCount;
    }
    if (endDate != null) {
      _endDate = endDate;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  Null get providerId => _providerId;
  set providerId(Null providerId) => _providerId = providerId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get dayCount => _dayCount;
  set dayCount(int? dayCount) => _dayCount = dayCount;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  WaitingListProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _userId = json['user_id'];
    _providerId = json['provider_id'];
    _name = json['name'];
    _status = json['status'];
    _description = json['description'];
    _dayCount = json['day_count'];
    _endDate = json['end_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['category_id'] = _categoryId;
    data['user_id'] = _userId;
    data['provider_id'] = _providerId;
    data['name'] = _name;
    data['status'] = _status;
    data['description'] = _description;
    data['day_count'] = _dayCount;
    data['end_date'] = _endDate;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
