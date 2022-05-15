class LeaveDisplay {
  String? date;
  String? paidLeaves;
  String? name;
  String? department;
  String? status;
  String? status1;
  String? status2;
  String? id;
  String? textinput;


  LeaveDisplay({this.date, this.paidLeaves,this.name,this.department,this.status,this.status1,this.status2,this.textinput});

  LeaveDisplay.fromJson(Map<String, dynamic> json) {
    date = json['date '];
    paidLeaves = json['paid leaves'];
    name = json['name'];
    department = json['department'];
    status = json['status'];
    status1 = json['status1'];
    status2 = json['status2'];
    id = json ['id'];
    textinput = json ['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date '] = this.date;
    data['paid leaves'] = this.paidLeaves;
    data['name']= this.name;
    data['department']= this.department;
    data['status'] = this.status;
    data['status1'] = this.status1;
    data['status2'] = this.status2;
    data['id'] = this.id;
    data[' text input']= this.textinput;

    return data;
  }
}