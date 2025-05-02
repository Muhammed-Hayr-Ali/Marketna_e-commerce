class AddressModel {
  // Fields
  int? id;
  String? userId;
  String? email;
  String? addressName;
  String? country;
  String? flag;
  String? province;
  String? city;
  String? street;
  String? countryCode;
  String? phoneNumber;
  String? notes;
  Map<String, dynamic>? location;
  String? createdAt;

  // Constructor to initialize the fields
  AddressModel({
    this.id,
    this.userId,
    this.email,
    this.addressName,
    this.country,
    this.flag,
    this.province,
    this.city,
    this.street,
    this.countryCode,
    this.phoneNumber,
    this.notes,
    this.location,
    this.createdAt,
  });

  // Factory method to create an instance from a map
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      userId: json['user_id'],
      email: json['email'],
      addressName: json['address_name'],
      country: json['country'],
      flag: json['flag'],
      province: json['province'],
      city: json['city'],
      street: json['street'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      notes: json['notes'],
      location: json['location'],
      createdAt: json['created_at'],
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'address_name': addressName,
      'country': country,
      'flag': flag,
      'province': province,
      'city': city,
      'street': street,
      'country_code': countryCode,
      'phone_number': phoneNumber,
      'notes': notes,
      'location': location,
      'created_at': createdAt,
    };
  }

  @override
  String toString() {
    return 'AddressModel{id: $id, user_id: $userId, email: $email, addressName: $addressName, country: $country, flag: $flag, province: $province, city: $city, streetAddress: $street, countryCode: $countryCode, phoneNumber: $phoneNumber, notes: $notes, location: $location, createdAt: $createdAt}';
  }
}
