class CreateNewModule {
  String? moduleName;
  String? moduleEndDate;
  String? moduleStartDate;
  String? moduleDuration;
  String? moduleType;
  String? mouleleadname;



  CreateNewModule(
      {this.moduleName,
        this.moduleEndDate,
        this.moduleStartDate,
        this.moduleDuration,
        this.moduleType,
        this.mouleleadname,
      });

  CreateNewModule.fromJson(Map<String, dynamic> json) {
    moduleName = json['ModuleName'];
    moduleEndDate = json['Module_end_date'];
    moduleStartDate = json['Module_start_date'];
    moduleDuration = json['Moduleduration'];
    moduleType = json['Moduletype'];
    mouleleadname = json['mouleleadname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ModuleName'] = this.moduleName;
    data['Module_end_date'] = this.moduleEndDate;
    data['Module_start_date'] = this.moduleStartDate;
    data['ModuleDuration'] = this.moduleDuration;
    data['ModuleType'] = this.moduleType;
    data['mouleleadname'] = this.mouleleadname;
    return data;
  }
}