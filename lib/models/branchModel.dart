class BranchModel {
String? branchName;
String? location;
String? address;
String? bid;
String? cid;

BranchModel({this.branchName, this.location, this.address, this.bid, this.cid});

BranchModel.fromJson(Map<String, dynamic> json) {
branchName = json['branch_name'];
location = json['loaction'];
address = json['address'];
bid = json['bid'];
cid = json['cid'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['branch_name'] = this.branchName;
  data['loaction'] = this.location;
  data['address'] = this.address;
  data['bid'] = this.bid;
  data['cid'] = this.cid;
  return data;
}
}