class Address {
  // Fields
  final int? id;
  final String? userId;
  final String? addressName;
  final String? country;
  final String? flag;
  final String? province;
  final String? city;
  final String? street;
  final String? countryCode;
  final String? phoneNumber;
  final String? notes;
  final Map<String, dynamic>? location;
  DateTime? createdAt;

  // Constructor to initialize the fields
  Address({
    this.id,
    this.userId,
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
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
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
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
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
    };
  }

  @override
  String toString() {
    return 'Address{'
        'id: $id, '
        'user_id: $userId, '
        'addressName: $addressName, '
        'country: $country, '
        'flag: $flag, '
        'province: $province, '
        'city: $city, '
        'streetAddress: $street, '
        'countryCode: $countryCode, '
        'phoneNumber: $phoneNumber, '
        'notes: $notes, '
        'location: $location,'
        'createdAt: $createdAt}';
  }
}
