

class ComponentModel {
  String? name,
      comid,
      quantity,
      sold,
      price,
      unit,
      cid;


  ComponentModel({
    this.name,
    this.comid,
    this.quantity,
    this.sold,
    this.price,
    this.unit,
    this.cid,
  });

  ComponentModel fromJson(Map<String, dynamic> json) {
    return ComponentModel(
      name: json["name"],
      comid: json["comid"],
      quantity: json["quantity"],
      sold: json["sold"],
      price: json["price"],
      unit: json["unit"],
      cid: json["cid"],

    );
  }

  toJson(ComponentModel json) {
    return {
      'name': json.name,
      'comid':  json.comid,
      'quantity': json.quantity,
      'sold':  json.sold,
      'price': json.price,
      'unit': json.unit,
      'cid':   json. cid,

    };
  }

}