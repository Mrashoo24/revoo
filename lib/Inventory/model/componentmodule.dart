class Componentmodule {
  String? componentName;
  String? componentPrice;
  String? componentUnit;
  String? quantity;

  Componentmodule(
      {this.componentName,
      this.componentPrice,
      this.componentUnit,
      this.quantity});

  Componentmodule.fromJson(Map<String, dynamic> json) {
    componentName = json['component_name'];
    componentPrice = json['component_price'];
    componentUnit = json['component_unit'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['component_name'] = this.componentName;
    data['component_price'] = this.componentPrice;
    data['component_unit'] = this.componentUnit;
    data['quantity'] = this.quantity;
    return data;
  }
}
