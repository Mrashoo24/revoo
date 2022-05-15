// class YourLeaveReq {
//   String? pending;
//   String? remaining;
//   String? taken;
//   String? bid;
//   String? cid;
//   String? did;
//
//   YourLeaveReq({this.pending, this.remaining, this.taken});
//
//   YourLeaveReq.fromJson(Map<String, dynamic> json) {
//     pending = json['pending '];
//     remaining = json['remaining'];
//     taken = json['taken'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['pending '] = this.pending;
//     data['remaining'] = this.remaining;
//     data['taken'] = this.taken;
//     return data;
//   }
// }
class YourLeaveReq {
  String? cid;
  String? countbased;
  String? limit;
  String? lreqid;
  String? subtitle;
  String? tenure;
  String? timebased;
  String? title;

  YourLeaveReq(
      {this.cid,
        this.countbased,
        this.limit,
        this.lreqid,
        this.subtitle,
        this.tenure,
        this.timebased,
        this.title});

  YourLeaveReq.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    countbased = json['countbased'];
    limit = json['limit'];
    lreqid = json['lreqid'];
    subtitle = json['subtitle'];
    tenure = json['tenure'];
    timebased = json['timebased'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['countbased'] = this.countbased;
    data['limit'] = this.limit;
    data['lreqid'] = this.lreqid;
    data['subtitle'] = this.subtitle;
    data['tenure'] = this.tenure;
    data['timebased'] = this.timebased;
    data['title'] = this.title;
    return data;
  }
}