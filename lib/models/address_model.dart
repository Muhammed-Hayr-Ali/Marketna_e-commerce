class Address {
  // Fields
  final int? id;
  final String? customerId;
  final String? addressName;
  final String? streetAddress;
  final String? city;
  final String? stateProvince;
  final String? country;
  final String? countryCode;
  final String? phoneNumber;
  final String? notes;
  final Map<String, dynamic>? location;

  // Constructor to initialize the fields
  Address({
    this.id,
    this.customerId,
    this.addressName,
    this.streetAddress,
    this.city,
    this.stateProvince,
    this.country,
    this.countryCode,
    this.phoneNumber,
    this.notes,
    this.location,
  });

  // Factory method to create an instance from a map
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      customerId: json['customer_id'],
      addressName: json['address_name'],
      streetAddress: json['street_address'],
      city: json['city'],
      stateProvince: json['state/province'],
      country: json['country'],
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
      notes: json['notes'],
      location: json['location'],
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'address_name': addressName,
      'street_address': streetAddress,
      'city': city,
      'state/province': stateProvince,
      'country': country,
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
        'customerId: $customerId, '
        'addressName: $addressName, '
        'streetAddress: $streetAddress, '
        'city: $city, '
        'stateProvince: $stateProvince, '
        'country: $country, '
        'countryCode: $countryCode, '
        'phoneNumber: $phoneNumber, '
        'notes: $notes, '
        'location: $location}';
  }
}
