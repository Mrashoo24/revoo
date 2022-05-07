class TransferModel {
  String? contactName;
  String? date;
  String? operationType;
  String? tags;
  String? onlinePayment;
  String? onlineSignature;
  String? generatedPdf;

  TransferModel(
      {this.contactName,
        this.date,
        this.operationType,
        this.tags,
        this.onlinePayment,
        this.onlineSignature,
        this.generatedPdf});

  TransferModel.fromJson(Map<String, dynamic> json) {
    contactName = json['contact name'];
    date = json['date'];
    operationType = json['operation type'];
    tags = json['tags'];
    onlinePayment = json['online payment'];
    onlineSignature = json['online signature'];
    generatedPdf = json['generated pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact name'] = this.contactName;
    data['date'] = this.date;
    data['operation type'] = this.operationType;
    data['tags'] = this.tags;
    data['online payment'] = this.onlinePayment;
    data['online signature'] = this.onlineSignature;
    data['generated pdf'] = this.generatedPdf;
    return data;

  }
}