class Employee {
  Employee({
    this.empName,
    this.empEmail,
    this.empAddress,
    this.empSalary,
    this.empMobile,
    this.empId,
  });

  Employee.fromJson(dynamic json) {
    empName = json['emp_name'];
    empEmail = json['emp_email'];
    empAddress = json['emp_address'];
    empSalary = json['emp_salary'];
    empMobile = json['emp_mobile'];
    empId = json['emp_id'];
  }

  String? empName;
  String? empEmail;
  String? empAddress;
  String? empSalary;
  String? empMobile;
  num? empId;

  Employee copyWith({
    String? empName,
    String? empEmail,
    String? empAddress,
    String? empSalary,
    String? empMobile,
    num? empId,
  }) =>
      Employee(
        empName: empName ?? this.empName,
        empEmail: empEmail ?? this.empEmail,
        empAddress: empAddress ?? this.empAddress,
        empSalary: empSalary ?? this.empSalary,
        empMobile: empMobile ?? this.empMobile,
        empId: empId ?? this.empId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emp_name'] = empName;
    map['emp_email'] = empEmail;
    map['emp_address'] = empAddress;
    map['emp_salary'] = empSalary;
    map['emp_mobile'] = empMobile;
    map['emp_id'] = empId;
    return map;
  }
}
