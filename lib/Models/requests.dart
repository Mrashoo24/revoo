class Requestss {
  String? certificateName;
  String? date;
  String? status;
  String? reason;

  Requestss({this.certificateName, this.date, this.status,this.reason});

  Requestss.fromJson(Map<String, dynamic> json) {
    certificateName = json['certificate name'];
    date = json['date'];
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificate name'] = this.certificateName;
    data['date'] = this.date;
    data['status'] = this.status;
    data['reason'] = this.reason;
    return data;
  }
}