class UserModal {
  String? userName;
  String? userDesignation;
  String? email;
  String? pictureUrl;
  String? token;

  UserModal({
    this.userName,
    this.userDesignation,
    this.email,
    this.pictureUrl,
    this.token,
  });

  UserModal.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userDesignation = json['userDesignation'];
    email = json['email'];
    pictureUrl = json['pictureUrl'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userName'] = this.userName;
    data['userDesignation'] = this.userDesignation;
    data['email'] = this.email;
    data['pictureUrl'] = this.pictureUrl;
    data['token'] = this.token;

    return data;
  }
}
