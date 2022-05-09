class Inventoryreportmodel {
  String? productName;

  String? intlPrice;

  String? localPrice;

  Inventoryreportmodel({this.productName, this.intlPrice, this.localPrice});

  Inventoryreportmodel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    intlPrice = json['intl_price'];
    localPrice = json['local_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['intl_price'] = this.intlPrice;
    data['local_price'] = this.localPrice;
    return data;
  }
}
