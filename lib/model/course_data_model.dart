class CourseDataModel {
  String? coreSerial;
  String? status;
  String? originalLaunch;
  String? details;

  CourseDataModel(
      {this.coreSerial,
        this.status,
        this.originalLaunch,
        this.details});

  CourseDataModel.fromJson(dynamic json) {
    coreSerial = json['core_serial'];
    status = json['status'];
    originalLaunch = json['original_launch'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core_serial'] = this.coreSerial;
    data['status'] = this.status;
    data['original_launch'] = this.originalLaunch;
    data['details'] = this.details;
    return data;
  }
}

