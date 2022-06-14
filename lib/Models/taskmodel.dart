class AddTaskOne {
  String? assignto;
  String? description;
  String? enddate;
  String? moduletype;
  String? projectname;
  String? startdate;
  String? status;
  String? taskTitle;

  AddTaskOne(
      {this.assignto,
        this.description,
        this.enddate,
        this.moduletype,
        this.projectname,
        this.startdate,
        this.status,
        this.taskTitle});

  AddTaskOne.fromJson(Map<String, dynamic> json) {
    assignto = json['assignto'];
    description = json['description'];
    enddate = json['enddate'];
    moduletype = json['moduletype'];
    projectname = json['projectname'];
    startdate = json['startdate'];
    status = json['status'];
    taskTitle = json['task_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assignto'] = this.assignto;
    data['description'] = this.description;
    data['enddate'] = this.enddate;
    data['moduletype'] = this.moduletype;
    data['projectname'] = this.projectname;
    data['startdate'] = this.startdate;
    data['status'] = this.status;
    data['task_title'] = this.taskTitle;
    return data;
  }
}