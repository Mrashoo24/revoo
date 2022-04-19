class DepartmentModel {
  String? deptName;
  String? head;
  String? noEmployee;

  DepartmentModel({this.deptName, this.head, this.noEmployee});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    deptName = json['Dept Name'];
    head = json['Head'];
    noEmployee = json['No.Employee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Dept Name'] = this.deptName;
    data['Head'] = this.head;
    data['No.Employee'] = this.noEmployee;
    return data;
  }
}