class ProjectListModal {
  int? id;
  String? projectNo;
  String? projectType;
  String? projectName;
  String? paymentReceived;
  String? pendingPayments;
  String? budgetUtilization;
  String? projectProgress;
  String? latestInvoiceMonth;
  String? latestExpenditureMonth;
  String? latestPaymentMonth;

  ProjectListModal(
      {this.id,
      this.projectNo,
      this.projectType,
      this.projectName,
      this.paymentReceived,
      this.pendingPayments,
      this.budgetUtilization,
      this.projectProgress,
      this.latestInvoiceMonth,
      this.latestExpenditureMonth,
      this.latestPaymentMonth});

  ProjectListModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectNo = json['projectNo'];
    projectType = json['projectType'];
    projectName = json['projectName'];
    paymentReceived = json['paymentReceived'];
    pendingPayments = json['pendingPayments'];
    budgetUtilization = json['budgetUtilization'];
    projectProgress = json['projectProgress'];
    latestInvoiceMonth = json['latestInvoiceMonth'];
    latestExpenditureMonth = json['latestExpenditureMonth'];
    latestPaymentMonth = json['latestPaymentMonth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['projectNo'] = this.projectNo;
    data['projectType'] = this.projectType;
    data['projectName'] = this.projectName;
    data['paymentReceived'] = this.paymentReceived;
    data['pendingPayments'] = this.pendingPayments;
    data['budgetUtilization'] = this.budgetUtilization;
    data['projectProgress'] = this.projectProgress;
    data['latestInvoiceMonth'] = this.latestInvoiceMonth;
    data['latestExpenditureMonth'] = this.latestExpenditureMonth;
    data['latestPaymentMonth'] = this.latestPaymentMonth;
    return data;
  }
}
