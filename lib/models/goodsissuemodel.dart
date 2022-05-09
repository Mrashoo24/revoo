class Goodsissuemodel {
  String? date;
  String? issue;

  Goodsissuemodel({this.date, this.issue});

  Goodsissuemodel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    issue = json['issue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['issue'] = this.issue;
    return data;
  }
}
