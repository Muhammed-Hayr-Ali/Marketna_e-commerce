class Country {
  int? id;
  String? name;
  String? nameAr;
  String? emoji;
  String? code;
  String? isoCode;
  String? flag;
  List<Province>? province;

  Country({
    this.id,
    this.name,
    this.nameAr,
    this.emoji,
    this.code,
    this.isoCode,
    this.flag,
    this.province,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    emoji = json['emoji'];
    code = json['code'];
    isoCode = json['iso_code'];
    flag = json['flag'];
    if (json['state'] != null) {
      province = <Province>[];
      json['state'].forEach((v) {
        province!.add(Province.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['emoji'] = emoji;
    data['code'] = code;
    data['iso_code'] = isoCode;
    data['flag'] = flag;
    if (province != null) {
      data['state'] = province!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Country{id: $id, name: $name, nameAr: $nameAr, emoji: $emoji, code: $code, isoCode: $isoCode, flag: $flag, province: $province}';
  }
}

class Province {
  int? id;
  String? name;
  String? nameAr;
  int? countryId;
  List<City>? city;

  Province({this.id, this.name, this.nameAr, this.countryId, this.city});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    countryId = json['country_id'];
    if (json['city'] != null) {
      city = <City>[];
      json['city'].forEach((v) {
        city!.add(City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['country_id'] = countryId;
    if (city != null) {
      data['city'] = city!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Province{id: $id, name: $name, nameAr: $nameAr, countryId: $countryId, city: $city}';
  }
}

class City {
  int? id;
  String? name;
  int? stateId;

  City({this.id, this.name, this.stateId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    return data;
  }

  @override
  String toString() {
    return 'City{id: $id, name: $name, stateId: $stateId}';
  }
}
