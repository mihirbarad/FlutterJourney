class LoginModel {
  int? id;
  String? fullname;

  String? mobile;

  LoginModelMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['fullname'] = fullname!;
    mapping['mobile'] = mobile!;

    return mapping;
  }
}
