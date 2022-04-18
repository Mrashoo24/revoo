class CreatEmpModel {
  String? empName;
  String? selectBranch;
  String? selectManager;
  String? selectHr;
  String? fullAdsress;
  String? designation;
  String? dob;
  String? email;
  String? password;
  String? phoneNumber;
  String? selectShift;
  String? selectRoles;

  CreatEmpModel(
      {this.empName,
        this.selectBranch,
        this.selectManager,
        this.selectHr,
        this.fullAdsress,
        this.designation,
        this.dob,
        this.email,
        this.password,
        this.phoneNumber,
        this.selectShift,
        this.selectRoles});

  CreatEmpModel.fromJson(Map<String, dynamic> json) {
    empName = json['emp_Name'];
    selectBranch = json['select_branch'];
    selectManager = json['select_manager'];
    selectHr = json['select_hr'];
    fullAdsress = json['full_adsress'];
    designation = json['designation'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
    selectShift = json['select_shift'];
    selectRoles = json['select_roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_Name'] = this.empName;
    data['select_branch'] = this.selectBranch;
    data['select_manager'] = this.selectManager;
    data['select_hr'] = this.selectHr;
    data['full_adsress'] = this.fullAdsress;
    data['designation'] = this.designation;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    data['select_shift'] = this.selectShift;
    data['select_roles'] = this.selectRoles;
    return data;
  }
}