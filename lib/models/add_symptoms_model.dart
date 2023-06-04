class AddSymptomsModel {
  String? message;
  Data? data;

  AddSymptomsModel({this.message, this.data});

  AddSymptomsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? fieldCount;
  int? affectedRows;
  int? insertId;
  String? info;
  int? serverStatus;
  int? warningStatus;

  Data(
      {this.fieldCount,
        this.affectedRows,
        this.insertId,
        this.info,
        this.serverStatus,
        this.warningStatus});

  Data.fromJson(Map<String, dynamic> json) {
    fieldCount = json['fieldCount'];
    affectedRows = json['affectedRows'];
    insertId = json['insertId'];
    info = json['info'];
    serverStatus = json['serverStatus'];
    warningStatus = json['warningStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldCount'] = this.fieldCount;
    data['affectedRows'] = this.affectedRows;
    data['insertId'] = this.insertId;
    data['info'] = this.info;
    data['serverStatus'] = this.serverStatus;
    data['warningStatus'] = this.warningStatus;
    return data;
  }
}