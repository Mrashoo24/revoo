class Goodsissuemodel {
  String? date;
  String? issue;
  String? description;
  String? product;
  String? bid;
  String? cid;
  String? status;
  String? user;
  String? id;

  Goodsissuemodel({this.date, this.issue,this.description,this.product,
    this.cid,this.bid,this.status,this.user,this.id
  });

  Goodsissuemodel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    issue = json['issue'];
    description = json['description'];
    product = json['product'];
    cid = json['cid'];
    bid = json['bid'];
    status = json['status'];
    user = json['user'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['issue'] = this.issue;
    data['description'] = this.description;
    data['product'] = this.product;
    data['bid'] = this.bid;
    data['cid'] = this.cid;
    data['status'] = this.status;
    data['user'] = this.user;
    data['id'] = this.id;
    return data;
  }
}