class ProjectModel {
  String? deadline;
  String? leadName;
  String? name;
  String? teamName;
  String? projecttype;
  String? startdate;


  ProjectModel({this.deadline, this.leadName, this.name, this.teamName, this.projecttype,this.startdate });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    deadline = json['Deadline'];
    leadName = json['Lead_Name'];
    name = json['Project_Name'];
    teamName = json['Team_Name'];
    projecttype = json['projecttype'];
    startdate = json['startdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Deadline'] = this.deadline;
    data['Lead_Name'] = this.leadName;
    data['Project_Name'] = this.name;
    data['Team_Name'] = this.teamName;
    data['projecttype'] = this.projecttype;
    data['startdate'] = this.startdate;
    return data;
  }
}
