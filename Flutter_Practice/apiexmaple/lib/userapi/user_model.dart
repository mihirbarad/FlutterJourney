class UserModel {
  List<Users>? users;
  int? total;
  int? skip;
  int? limit;

  UserModel({this.users, this.total, this.skip, this.limit});

  UserModel.fromJson(Map<String, dynamic> json) {
    users = json["users"] == null
        ? null
        : (json["users"] as List).map((e) => Users.fromJson(e)).toList();
    total = json["total"];
    skip = json["skip"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (users != null) {
      _data["users"] = users?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["skip"] = skip;
    _data["limit"] = limit;
    return _data;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  var weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.maidenName,
      this.age,
      this.gender,
      this.email,
      this.phone,
      this.username,
      this.password,
      this.birthDate,
      this.image,
      this.bloodGroup,
      this.height,
      this.weight,
      this.eyeColor,
      this.hair,
      this.domain,
      this.ip,
      this.address,
      this.macAddress,
      this.university,
      this.bank,
      this.company,
      this.ein,
      this.ssn,
      this.userAgent});

  Users.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    maidenName = json["maidenName"];
    age = json["age"];
    gender = json["gender"];
    email = json["email"];
    phone = json["phone"];
    username = json["username"];
    password = json["password"];
    birthDate = json["birthDate"];
    image = json["image"];
    bloodGroup = json["bloodGroup"];
    height = json["height"];
    weight = json["weight"];
    eyeColor = json["eyeColor"];
    hair = json["hair"] == null ? null : Hair.fromJson(json["hair"]);
    domain = json["domain"];
    ip = json["ip"];
    address =
        json["address"] == null ? null : Address.fromJson(json["address"]);
    macAddress = json["macAddress"];
    university = json["university"];
    bank = json["bank"] == null ? null : Bank.fromJson(json["bank"]);
    company =
        json["company"] == null ? null : Company.fromJson(json["company"]);
    ein = json["ein"];
    ssn = json["ssn"];
    userAgent = json["userAgent"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["maidenName"] = maidenName;
    _data["age"] = age;
    _data["gender"] = gender;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["username"] = username;
    _data["password"] = password;
    _data["birthDate"] = birthDate;
    _data["image"] = image;
    _data["bloodGroup"] = bloodGroup;
    _data["height"] = height;
    _data["weight"] = weight;
    _data["eyeColor"] = eyeColor;
    if (hair != null) {
      _data["hair"] = hair?.toJson();
    }
    _data["domain"] = domain;
    _data["ip"] = ip;
    if (address != null) {
      _data["address"] = address?.toJson();
    }
    _data["macAddress"] = macAddress;
    _data["university"] = university;
    if (bank != null) {
      _data["bank"] = bank?.toJson();
    }
    if (company != null) {
      _data["company"] = company?.toJson();
    }
    _data["ein"] = ein;
    _data["ssn"] = ssn;
    _data["userAgent"] = userAgent;
    return _data;
  }
}

class Company {
  Address1? address;
  String? department;
  String? name;
  String? title;

  Company({this.address, this.department, this.name, this.title});

  Company.fromJson(Map<String, dynamic> json) {
    address =
        json["address"] == null ? null : Address1.fromJson(json["address"]);
    department = json["department"];
    name = json["name"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (address != null) {
      _data["address"] = address?.toJson();
    }
    _data["department"] = department;
    _data["name"] = name;
    _data["title"] = title;
    return _data;
  }
}

class Address1 {
  String? address;
  String? city;
  Coordinates1? coordinates;
  String? postalCode;
  String? state;

  Address1(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  Address1.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    city = json["city"];
    coordinates = json["coordinates"] == null
        ? null
        : Coordinates1.fromJson(json["coordinates"]);
    postalCode = json["postalCode"];
    state = json["state"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address"] = address;
    _data["city"] = city;
    if (coordinates != null) {
      _data["coordinates"] = coordinates?.toJson();
    }
    _data["postalCode"] = postalCode;
    _data["state"] = state;
    return _data;
  }
}

class Coordinates1 {
  double? lat;
  double? lng;

  Coordinates1({this.lat, this.lng});

  Coordinates1.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }
}

class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank(
      {this.cardExpire,
      this.cardNumber,
      this.cardType,
      this.currency,
      this.iban});

  Bank.fromJson(Map<String, dynamic> json) {
    cardExpire = json["cardExpire"];
    cardNumber = json["cardNumber"];
    cardType = json["cardType"];
    currency = json["currency"];
    iban = json["iban"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cardExpire"] = cardExpire;
    _data["cardNumber"] = cardNumber;
    _data["cardType"] = cardType;
    _data["currency"] = currency;
    _data["iban"] = iban;
    return _data;
  }
}

class Address {
  String? address;
  String? city;
  Coordinates? coordinates;
  String? postalCode;
  String? state;

  Address(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    address = json["address"];
    city = json["city"];
    coordinates = json["coordinates"] == null
        ? null
        : Coordinates.fromJson(json["coordinates"]);
    postalCode = json["postalCode"];
    state = json["state"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address"] = address;
    _data["city"] = city;
    if (coordinates != null) {
      _data["coordinates"] = coordinates?.toJson();
    }
    _data["postalCode"] = postalCode;
    _data["state"] = state;
    return _data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lng"] = lng;
    return _data;
  }
}

class Hair {
  String? color;
  String? type;

  Hair({this.color, this.type});

  Hair.fromJson(Map<String, dynamic> json) {
    color = json["color"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["color"] = color;
    _data["type"] = type;
    return _data;
  }
}
