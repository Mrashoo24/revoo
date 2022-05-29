class CreateRfqModel {
  String? createrfq;
  String? created;
  String? expirydate;
  String? quotationnumber;
  String? totalamount;
  String? components;
  String? cid;
  String? bid;
  String? did;
  String? mid;
  String? uid;
  String? date;
  String? status;
  String? vendors;
  String? recievedforms;



  CreateRfqModel(
      {this.createrfq,
        this.created,
        this.expirydate,
        this.quotationnumber,
        this.totalamount,
        this.components,
        this.cid,
        this.bid,
        this.did,
        this.mid,
        this.uid,
        this.date,
        this.status,
        this.recievedforms,
        this.vendors
      });

  CreateRfqModel.fromJson(Map<String, dynamic> json) {
    createrfq = json['createrfq'];
    created = json['created'];
    expirydate = json['expirydate'];
    quotationnumber = json['quotationnumber'];
    totalamount = json['totalamount'];
    components = json['components'];
    cid = json['cid'];
    bid = json['bid'];
    did = json['did'];
    mid = json['mid'];
    uid = json['uid'];
    date = json['date'];
    status = json['status'];
    vendors = json['vendors'];
    recievedforms = json['recievedforms'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createrfq'] = this.createrfq;
    data['created'] = this.created;
    data['expirydate'] = this.expirydate;
    data['quotationnumber'] = this.quotationnumber;
    data['totalamount'] = this.totalamount;
    data['components'] = this.components;
    data['cid'] = this.cid;
    data['bid'] = this.bid;
    data['did'] = this.did;
    data['mid'] = this.mid;
    data['uid'] = this.uid;

    data['date'] = this.date;
    data['status'] = this.status;

    data['vendors'] = this.vendors;
    data['recievedforms'] = this.recievedforms;

    return data;
  }
}