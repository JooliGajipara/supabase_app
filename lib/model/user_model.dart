class UserModel {
  UserModel({
    this.id,
    this.createdAt,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.userId,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    userId = json['user_id'];
  }

  int? id;
  String? createdAt;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? userId;

  UserModel copyWith({
    int? id,
    String? createdAt,
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    String? userId,
  }) =>
      UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['name'] = name;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['address'] = address;
    map['user_id'] = userId;
    return map;
  }
}
