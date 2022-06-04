class OrderModel {
  String? cid,cnumber,customer,date,price,product,quantity,status,id,address,orderNumber,cemail;


  OrderModel({
    this.cid,
    this.price,
    this.cnumber,
    this.quantity,
    this.date,
    this.status,
    this.customer,
    this.product,
    this.address,
    this.orderNumber,
    this.id,
    this.cemail
  });

  OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
        cid: json["cid"],
        price: json["price"],
        cnumber: json["cnumber"],
        quantity: json["quantity"],
        date: json["date"],
        status: json["status"],
        customer: json["customer"],
        product: json["product"],
        address: json["address"],
        orderNumber: json["orderNumber"],
        cemail: json['cemail'],
        id: json["id"]

    );
  }
  toJson(OrderModel json) {
    return {
      'cid': json.cid,
      'price':  json.price,
      'cnumber': json.cnumber,
      'quantity':  json.quantity,
      'date': json.date,
      'status': json.status,
      'customer':   json. customer,
      'product':   json. product,
      'address':   json. address,
      'orderNumber':   json. orderNumber,
      'cemail':   json. cemail,
      'id':   json. id,
    };
  }

}
