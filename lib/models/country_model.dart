class Country {
  int? id;
  String? name;
  String? nameAr;
  String? emoji;
  String? emojiU;
  String? code;
  String? isoCode;
  String? flag;
  List<Province>? province;
  DateTime? createdAt;

  Country({
    this.id,
    this.name,
    this.nameAr,
    this.emoji,
    this.emojiU,
    this.code,
    this.isoCode,
    this.flag,
    this.province,
    this.createdAt,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    code = json['code'];
    isoCode = json['isoCode'];
    flag = json['flag'];
    if (json['province'] != null) {
      province = <Province>[];
      json['province'].forEach((v) {
        province!.add(Province.fromJson(v));
      });
    }
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['emoji'] = emoji;
    data['emojiU'] = emojiU;
    data['code'] = code;
    data['isoCode'] = isoCode;
    data['flag'] = flag;
    if (province != null) {
      data['province'] = province!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Country{id: $id, name: $name, nameAr: $nameAr, emoji: $emoji, emojiU: $emojiU, code: $code, isoCode: $isoCode, flag: $flag, province: $province, createdAt: $createdAt}';
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
  int? provinceId;

  City({this.id, this.name, this.provinceId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['province_id'] = provinceId;
    return data;
  }

  @override
  String toString() {
    return 'City{id: $id, name: $name, provinceId: $provinceId}';
  }
}
