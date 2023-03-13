class EmployeeDocumentModel {
  int? id;
  int? hrEmployeeId;
  String? description;
  String? documentDate;
  String? fileName;
  String? extension;
  String? path;
  String? size;

  EmployeeDocumentModel(
      {this.id,
      this.hrEmployeeId,
      this.description,
      this.documentDate,
      this.fileName,
      this.extension,
      this.path,
      this.size});

  EmployeeDocumentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hrEmployeeId = json['hr_employee_id'];
    description = json['description'];
    documentDate = json['document_date'];
    fileName = json['file_name'];
    extension = json['extension'];
    path = json['path'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hr_employee_id'] = this.hrEmployeeId;
    data['description'] = this.description;
    data['document_date'] = this.documentDate;
    data['file_name'] = this.fileName;
    data['extension'] = this.extension;
    data['path'] = this.path;
    data['size'] = this.size;
    return data;
  }
}
