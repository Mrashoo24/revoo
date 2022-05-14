class ProductModel {
  String? name,
      id,
      quantity,
      sold,
      purchaseprice,
      sellprice,
      cid,components;


  ProductModel({
    this.name,
    this.id,
    this.quantity,
    this.sold,
    this.purchaseprice,
    this.sellprice,
    this.cid,
    this.components
  });

  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json["name"],
        id: json["id"],
        quantity: json["quantity"],
        sold: json["sold"],
        purchaseprice: json["purchaseprice"],
        sellprice: json["sellprice"],
        cid: json["cid"],
        components: json["components"]

    );
  }

  toJson(ProductModel json) {
    return {
      'name': json.name,
      'id':  json.id,
      'quantity': json.quantity,
      'sold':  json.sold,
      'purchaseprice': json.purchaseprice,
      'sellprice': json.sellprice,
      'cid':   json. cid,
      'components':   json. components,
    };
  }

}
