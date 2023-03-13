class AssetModal {
  int? id;
  String? assetCode;
  String? name;
  String? allocation;
  String? location;
  String? picture;

  AssetModal(
      {this.id,
      this.assetCode,
      this.name,
      this.allocation,
      this.location,
      this.picture});

  AssetModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetCode = json['asset_code'];
    name = json['name'];
    allocation = json['allocation'];
    location = json['location'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['asset_code'] = this.assetCode;
    data['name'] = this.name;
    data['allocation'] = this.allocation;
    data['location'] = this.location;
    data['picture'] = this.picture;
    return data;
  }
}
