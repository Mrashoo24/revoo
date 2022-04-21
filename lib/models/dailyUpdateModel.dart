class DailyUpdates {
  String? name;
  String? update;
  String? designation;
  String? date;

  DailyUpdates({this.name, this.update, this.designation, this.date});

  DailyUpdates.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    update = json['update'];
    designation = json['designation'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['update'] = this.update;
    data['designation'] = this.designation;
    data['date'] = this.date;
    return data;
  }
}
