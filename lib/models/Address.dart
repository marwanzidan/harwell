class Address {
  String address;
  String street_name;
  String apartment_number;
  String building_number;
  String notes;
  String region_id;

  Address({this.address, this.street_name, this.apartment_number,
      this.building_number, this.notes, this.region_id});

  Address.fromJson(Map<String, dynamic> json) {
    this.address = json["address"].toString();
    this.street_name = json["street_name"];
    this.apartment_number = json["apartment_number"];
    this.building_number = json["building_number"];
    this.notes = json["notes"];
    this.region_id = json["region_id"];
  }
}
