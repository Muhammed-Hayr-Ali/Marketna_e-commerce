class AddressModel {
  int? id;
  String? userId;
  String? addressName;
  String? street;
  String? city;
  String? province;
  String? country;
  String? phoneNumber;
  String? notes;
  Location? location;
  String? countryCode;
  String? flag;
  String? createdAt;

  AddressModel({
    this.id,
    this.userId,
    this.addressName,
    this.street,
    this.city,
    this.province,
    this.country,
    this.phoneNumber,
    this.notes,
    this.location,
    this.countryCode,
    this.flag,
    this.createdAt,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressName = json['address_name'];
    street = json['street'];
    city = json['city'];
    province = json['province'];
    country = json['country'];
    phoneNumber = json['phone_number'];
    notes = json['notes'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    countryCode = json['country_code'];
    flag = json['flag'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['address_name'] = addressName;
    data['street'] = street;
    data['city'] = city;
    data['province'] = province;
    data['country'] = country;
    data['phone_number'] = phoneNumber;
    data['notes'] = notes;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['country_code'] = countryCode;
    data['flag'] = flag;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  @override
  String toString() {
    return 'AddressModel(id: $id, userId: $userId, addressName: $addressName, street: $street, city: $city, province: $province, country: $country, phoneNumber: $phoneNumber, notes: $notes, location: $location, countryCode: $countryCode, flag: $flag, createdAt: $createdAt)';
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }
}
