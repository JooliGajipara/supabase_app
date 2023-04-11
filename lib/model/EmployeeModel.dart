import 'Employee.dart';

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.createdAt,
    this.employee,
    this.userId,
  });

  EmployeeModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
    userId = json['user_id'];
  }

  num? id;
  String? createdAt;
  Employee? employee;
  String? userId;

  EmployeeModel copyWith({
    num? id,
    String? createdAt,
    Employee? employee,
    String? userId,
  }) =>
      EmployeeModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        employee: employee ?? this.employee,
        userId: userId ?? this.userId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    if (employee != null) {
      map['employee'] = employee?.toJson();
    }
    map['user_id'] = userId;
    return map;
  }
}
