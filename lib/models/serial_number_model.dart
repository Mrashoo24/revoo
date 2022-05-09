class SerialModel {
  String? cid;
  String? bid;
  String? did;
  String? serialNo;
  String? productName;

  SerialModel({this.cid, this.bid, this.did, this.serialNo, this.productName});

  SerialModel.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    bid = json['bid'];
    did = json['did'];
    serialNo = json['serial_no'];
    productName = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['bid'] = this.bid;
    data['did'] = this.did;
    data['serial_no'] = this.serialNo;
    data['product_name'] = this.productName;
    return data;
  }
}