// ignore_for_file: unnecessary_getters_setters

class CategoryModel {
  int? _id;
  String? _name;
  String? _discription;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  CategoryModel(
      {int? id,
      String? name,
      String? discription,
      String? image,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (discription != null) {
      _discription = discription;
    }
    if (image != null) {
      _image = image;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get discription => _discription;
  set discription(String? discription) => _discription = discription;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _discription = json['discription'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['discription'] = _discription;
    data['image'] = _image;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
