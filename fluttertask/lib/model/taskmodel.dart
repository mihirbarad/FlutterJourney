class taskmodel {
  int? id;
  String? title;
  String? description;
  var time;
  var date;

  taskmodels() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['title'] = title!;
    mapping['description'] = description!;
    mapping['time'] = time!;
    mapping['date'] = date!;

    return mapping;
  }

  toJson() {}
}
