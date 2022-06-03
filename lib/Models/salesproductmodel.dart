class SalesProductModel {
  String?
  quantity,
      sold,
      date,
      productcategory,
      purchaseprice,
      sellprice,
      cid,
      components,
      productname,
      producttype,
      costprice;
  SalesProductModel({
    this.quantity,
    this.sold,
    this.purchaseprice,
    this.sellprice,
    this.cid,
    this.components,
    this. productname,
    this. costprice,
    this.producttype,
    this.productcategory,
    this.date
  });

  SalesProductModel fromJson(Map<String, dynamic> json) {
    return SalesProductModel(
      quantity: json["quantity"],
      sold: json["sold"],
      purchaseprice: json["purchaseprice"],
      sellprice: json["sellprice"],
      cid: json["cid"],
      components: json["components"],
      productname: json["productname"],
      costprice: json["costprice"],
      producttype:json['producttype'],
      productcategory: json["productcategory"],
      date:json['date'],

    );
  }

  toJson(SalesProductModel json) {
    return {
      'quantity': json.quantity,
      'sold':  json.sold,
      'purchaseprice': json.purchaseprice,
      'sellprice': json.sellprice,
      'cid':   json. cid,
      'components':   json. components,
      'productname':   json. productname,
      'costprice':   json. costprice,
      'producttype' : json.producttype,
      'productcategory':   json. productcategory,
      'date' : json.date

    };
  }

}