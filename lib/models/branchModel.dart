class BranchModel {
  String? branchName;
  String? address;
  String? location;
  String? bid;

  BranchModel({this.branchName, this.address, this.location, this.bid});

  BranchModel.fromJson(Map<String, dynamic> json) {
    branchName = json['branch_name'];
    address = json['address'];
    location = json['location'];
    bid = json['bid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_name'] = this.branchName;
    data['address'] = this.address;
    data['location'] = this.location;
    data['bid'] = this.bid;
    return data;
  }
}