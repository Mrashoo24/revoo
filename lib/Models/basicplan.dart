class BasicPlan {
  String? planid;
  String? name;
  String? cid;
  String? dateBought;
  String? dateExpire;
  String? nextPayment;
  String? appsIcluded;
  String? noOfEmp;

  BasicPlan(
      { this.planid,
         this.name,
         this.cid,
         this.dateBought,
         this.dateExpire,
         this.nextPayment,
         this.appsIcluded,
         this.noOfEmp});

  BasicPlan.fromJson(Map<String, dynamic> json) {
    planid = json['planid'];
    name = json['name'];
    cid = json['cid'];
    dateBought = json['dateBought'];
    dateExpire = json['dateExpire'];
    nextPayment = json['nextPayment'];
    appsIcluded = json['appsIcluded'];
    noOfEmp = json['noOfEmp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planid'] = this.planid;
    data['name'] = this.name;
    data['cid'] = this.cid;
    data['dateBought'] = this.dateBought;
    data['dateExpire'] = this.dateExpire;
    data['nextPayment'] = this.nextPayment;
    data['appsIcluded'] = this.appsIcluded;
    data['noOfEmp'] = this.noOfEmp;
    return data;
  }
}