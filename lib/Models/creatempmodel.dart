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
        this.selectRoles}
      );

  CreatEmpModel.fromJson(Map<String, dynamic> json) {
    empName = json['emp Name'];
    selectBranch = json['select branch'];
    selectManager = json['select manager'];
    selectHr = json['select hr'];
    fullAdsress = json['full adsress'];
    designation = json['designation'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone number'];
    selectShift = json['select shift'];
    selectRoles = json['select roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp Name'] = this.empName;
    data['select branch'] = this.selectBranch;
    data['select manager'] = this.selectManager;
    data['select hr'] = this.selectHr;
    data['full adsress'] = this.fullAdsress;
    data['designation'] = this.designation;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone number'] = this.phoneNumber;
    data['select shift'] = this.selectShift;
    data['select roles'] = this.selectRoles;
    return data;
  }
}

