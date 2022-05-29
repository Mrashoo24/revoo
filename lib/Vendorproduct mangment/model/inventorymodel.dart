class Inventoryreportmodel {
  String? name;

  String? quantity;

  String? type;

  String? date;

  String? bid;

  Inventoryreportmodel({
    this.bid,this.date,this.quantity,this.name,this.type
});

  Inventoryreportmodel.fromJson(Map<String, dynamic> json) {
    bid = json['bid'];
    name = json['name'];
    quantity = json['quantity'];
    date = json['date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bid'] = this.bid;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['date'] = this.date;
    data['type'] = this.type;
    return data;
  }
}