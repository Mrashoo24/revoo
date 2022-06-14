class AddMeetingOne {
  String? agenda;
  String? attendName;
  String? date;
  String? description;
  String? meeting;
  String? preparedBy;
  String? presenterName;
  String? projectName;
  String? venue;

  AddMeetingOne(
      {this.agenda,
        this.attendName,
        this.date,
        this.description,
        this.meeting,
        this.preparedBy,
        this.presenterName,
        this.projectName,
        this.venue});

  AddMeetingOne.fromJson(Map<String, dynamic> json) {
    agenda = json['agenda'];
    attendName = json['attend_name'];
    date = json['date'];
    description = json['description'];
    meeting = json['meeting'];
    preparedBy = json['prepared_by'];
    presenterName = json['presenter_name'];
    projectName = json['project_name'];
    venue = json['venue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agenda'] = this.agenda;
    data['attend_name'] = this.attendName;
    data['date'] = this.date;
    data['description'] = this.description;
    data['meeting'] = this.meeting;
    data['prepared_by'] = this.preparedBy;
    data['presenter_name'] = this.presenterName;
    data['project_name'] = this.projectName;
    data['venue'] = this.venue;
    return data;
  }
}