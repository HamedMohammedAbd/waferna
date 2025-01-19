// ignore_for_file: unnecessary_getters_setters, dead_code

class UserMerchantModel {
  int? _id;
  String? _name;
  String? _phone;
  String? _email;
  String? _role;
  String? _userType;
  int? _commercialRegister;
  String? _discription;
  Null _websiteLink;
  String? _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _imageUrl;

  UserMerchantModel(
      {int? id,
      String? name,
      String? phone,
      String? email,
      String? role,
      String? userType,
      int? commercialRegister,
      String? discription,
      Null websiteLink,
      Null emailVerifiedAt,
      String? createdAt,
      String? updatedAt,
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
    if (email != null) {
      _email = email;
    }
    if (role != null) {
      _role = role;
    }
    if (userType != null) {
      _userType = userType;
    }
    if (commercialRegister != null) {
      _commercialRegister = commercialRegister;
    }
    if (discription != null) {
      _discription = discription;
    }
    if (websiteLink != null) {
      _websiteLink = websiteLink;
    }
    if (emailVerifiedAt != null) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
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
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get role => _role;
  set role(String? role) => _role = role;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  int? get commercialRegister => _commercialRegister;
  set commercialRegister(int? commercialRegister) =>
      _commercialRegister = commercialRegister;
  String? get discription => _discription;
  set discription(String? discription) => _discription = discription;
  Null get websiteLink => _websiteLink;
  set websiteLink(Null websiteLink) => _websiteLink = websiteLink;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get imageUrl => _imageUrl;
  set imageUrl(String? imageUrl) => _imageUrl = imageUrl;

  UserMerchantModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _role = json['role'];
    _userType = json['user_type'];
    _commercialRegister = json['commercial_register'];
    _discription = json['discription'];
    _websiteLink = json['website_link'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['phone'] = _phone;
    data['email'] = _email;
    data['role'] = _role;
    data['user_type'] = _userType;
    data['commercial_register'] = _commercialRegister;
    data['discription'] = _discription;
    data['website_link'] = _websiteLink;
    data['email_verified_at'] = _emailVerifiedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['image_url'] = _imageUrl;
    return data;
  }
}
