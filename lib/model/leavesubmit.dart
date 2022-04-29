class LeaveReason {
  String? leaveReason;

  LeaveReason({this.leaveReason});

  LeaveReason.fromJson(Map<String, dynamic> json) {
    leaveReason = json['leave reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leave reason'] = this.leaveReason;
    return data;
  }
}