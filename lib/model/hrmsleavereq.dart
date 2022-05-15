class HrmsLeaveDate {
  String? reqDate;

  HrmsLeaveDate({this.reqDate});

  HrmsLeaveDate.fromJson(Map<String, dynamic> json) {
    reqDate = json['req date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req date'] = this.reqDate;
    return data;
  }
}