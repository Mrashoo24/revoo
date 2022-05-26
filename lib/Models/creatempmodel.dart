
class CreatEmpModel {
  String? address;
  String? branchName;
  String? designation;
  String? bid;
  String? cid;
  String? did;
  String? dob;
  String? email;
  String? empid;
  String? hid;
  String? mid;
  String? name;
  String? password;
  String? phoneNumber;
  String? reporting;
  String? shiftid;
  String? uid;

  CreatEmpModel(
      {this.address,
        this.branchName,
        this.designation,
        this.bid,
        this.cid,
        this.did,
        this.dob,
        this.email,
        this.empid,
        this.hid,
        this.mid,
        this.name,
        this.password,
        this.phoneNumber,
        this.reporting,
        this.shiftid,
        this.uid});

  CreatEmpModel.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    branchName = json['Branch Name'];
    designation = json['Designation'];
    bid = json['bid'];
    cid = json['cid'];
    did = json['did'];
    dob = json['dob'];
    email = json['email'];
    empid = json['empid'];
    hid = json['hid'];
    mid = json['mid'];
    name = json['name'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    reporting = json['reporting'];
    shiftid = json['shiftid'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address'] = this.address;
    data['Branch Name'] = this.branchName;
    data['Designation'] = this.designation;
    data['bid'] = this.bid;
    data['cid'] = this.cid;
    data['did'] = this.did;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['empid'] = this.empid;
    data['hid'] = this.hid;
    data['mid'] = this.mid;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    data['reporting'] = this.reporting;
    data['shiftid'] = this.shiftid;
    data['uid'] = this.uid;
    return data;
  }
}
