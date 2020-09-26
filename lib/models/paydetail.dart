class PayDetailModel {
  String total;
  String totalAfterTaxes;
  List<Services> services;

  PayDetailModel({
    this.total,
    this.totalAfterTaxes,
    this.services,
  });

  PayDetailModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalAfterTaxes = json['final'];
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['final'] = this.totalAfterTaxes;
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String name;
  String amount;

  Services({this.name, this.amount});

  Services.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}
