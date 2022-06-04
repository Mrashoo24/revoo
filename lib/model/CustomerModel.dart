class CustomerModel {
  String? cid,name,number,address,email,id,bid,orders;


  CustomerModel({
    this.cid,
    this.name,
    this.number,
    this.id,
    this.address,
    this.email,
    this.bid,
    this.orders
  });

  CustomerModel fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        cid: json["cid"],
        id: json["id"],
      name: json["name"],
      number: json["number"],
      address: json["address"],
      email: json["email"],
      bid: json["bid"],
      orders: json["orders"],
    );
  }
  toJson(CustomerModel json) {
    return {
      'cid': json.cid,
      'id':   json. id,
      'name':   json. name,
      'number':   json. number,
      'address':   json. address,
      'email':   json. email,
      'bid':   json. bid,
      'orders':   json. orders,
    };
  }

}
