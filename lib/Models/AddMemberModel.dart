class ProjectMember {
  String? employee;
  String? employeeHireDate;
  String? employeeManagerName;
  String? employeeReleaseDate;
  String? purposeOfHire;

  ProjectMember(
      {this.employee,
        this.employeeHireDate,
        this.employeeManagerName,
        this.employeeReleaseDate,
        this.purposeOfHire});

  ProjectMember.fromJson(Map<String, dynamic> json) {
    employee = json['Employee'];
    employeeHireDate = json['Employee_hire_date'];
    employeeManagerName = json['Employee_manager_name'];
    employeeReleaseDate = json['Employee_release_date'];
    purposeOfHire = json['Purpose_of_hire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Employee'] = this.employee;
    data['Employee_hire_date'] = this.employeeHireDate;
    data['Employee_manager_name'] = this.employeeManagerName;
    data['Employee_release_date'] = this.employeeReleaseDate;
    data['Purpose_of_hire'] = this.purposeOfHire;
    return data;
  }
}