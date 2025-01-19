// ignore_for_file: unnecessary_getters_setters, dead_code

class ProductsModel {
  int? _id;
  String? _name;
  int? _categoryId;
  int? _userId;
  String? _description;
  int? _price;
  String? _phone;
  String? _place;
  String? _createdAt;
  String? _updatedAt;
  String? _coverImageUrl;
  User? _user;

  ProductsModel(
      {int? id,
      String? name,
      int? categoryId,
      int? userId,
      String? description,
      int? price,
      String? phone,
      String? place,
      String? createdAt,
      String? updatedAt,
      String? coverImageUrl,
      User? user}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (description != null) {
      _description = description;
    }
    if (price != null) {
      _price = price;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (place != null) {
      _place = place;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (coverImageUrl != null) {
      _coverImageUrl = coverImageUrl;
    }
    if (user != null) {
      _user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get price => _price;
  set price(int? price) => _price = price;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get place => _place;
  set place(String? place) => _place = place;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get coverImageUrl => _coverImageUrl;
  set coverImageUrl(String? coverImageUrl) => _coverImageUrl = coverImageUrl;
  User? get user => _user;
  set user(User? user) => _user = user;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _categoryId = json['category_id'];
    _userId = json['user_id'];
    _description = json['description'];
    _price = json['price'];
    _phone = json['phone'];
    _place = json['place'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _coverImageUrl = json['cover_image_url'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['category_id'] = _categoryId;
    data['user_id'] = _userId;
    data['description'] = _description;
    data['price'] = _price;
    data['phone'] = _phone;
    data['place'] = _place;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['cover_image_url'] = _coverImageUrl;
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  String? _phone;
  String? _discription;
  Null _websiteLink;
  String? _imageUrl;

  User(
      {int? id,
      String? name,
      String? phone,
      Null discription,
      Null websiteLink,
      String? imageUrl}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (discription != null) {
      _discription = discription;
    }
    if (websiteLink != null) {
      _websiteLink = websiteLink;
    }
    if (imageUrl != null) {
      _imageUrl = imageUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get discription => _discription;
  set discription(String? discription) => _discription = discription;
  Null get websiteLink => _websiteLink;
  set websiteLink(Null websiteLink) => _websiteLink = websiteLink;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _discription = json['discription'];
    _websiteLink = json['website_link'];
    _imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['phone'] = _phone;
    data['discription'] = _discription;
    data['website_link'] = _websiteLink;
    data['image_url'] = _imageUrl;
    return data;
  }
}
