class AttendencReportModel {
  String? date;
  String? reason;
  String? mid;
  String? uid;
  String? checkin;
  String? workingHours;
  String? workingStatus;
  String? id;
  String? bid;
  String? checkout;
  String? did;
  String? status;
  String? timestamp;
  String? cid;
  String? difference;
  String? latitude;
  String? longitude;

  AttendencReportModel(
      {this.date,
        this.reason,
        this.mid,
        this.uid,
        this.checkin,
        this.workingHours,
        this.workingStatus,
        this.id,
        this.bid,
        this.checkout,
        this.did,
        this.status,
        this.timestamp,
        this.cid,this.difference,
        this.latitude,
        this.longitude

        });

  AttendencReportModel.fromJson(Map<String, dynamic> json) {

    date = json['date'];
    reason = json['reason'];
    mid = json['mid'];
    uid = json['uid'];
    checkin = json['checkin'];
    workingHours = json['working_hours'];
    workingStatus = json['working_status'];
    id = json['id'];
    bid = json['bid'];
    checkout = json['checkout'];
    did = json['did'];
    status = json['status'];
    timestamp = json['timestamp'];
    cid = json['cid'];
    difference = json['difference'];
    latitude = json['latitude'];
    longitude = json['longitude'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['reason'] = this.reason;
    data['mid'] = this.mid;
    data['uid'] = this.uid;
    data['checkin'] = this.checkin;
    data['working_hours'] = this.workingHours;
    data['working_status'] = this.workingStatus;
    data['id'] = this.id;
    data['bid'] = this.bid;
    data['checkout'] = this.checkout;
    data['did'] = this.did;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    data['cid'] = this.cid;
    data['difference'] = this.difference;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
