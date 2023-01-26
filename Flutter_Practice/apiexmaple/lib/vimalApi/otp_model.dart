
class OtpModel {
    List<City>? city;
    String? headline;
    String? button;

    OtpModel({this.city, this.headline, this.button});

    OtpModel.fromJson(Map<String, dynamic> json) {
        city = json["city"] == null ? null : (json["city"] as List).map((e) => City.fromJson(e)).toList();
        headline = json["headline"];
        button = json["button"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(city != null) {
            _data["city"] = city?.map((e) => e.toJson()).toList();
        }
        _data["headline"] = headline;
        _data["button"] = button;
        return _data;
    }
}

class City {
    String? id;
    String? categoryName;

    City({this.id, this.categoryName});

    City.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        categoryName = json["category_name"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["category_name"] = categoryName;
        return _data;
    }
}