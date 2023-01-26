class ComentModel {
  final String? username;
  final int id;
  final String? name;
  final String address;
  final String? email;
  const ComentModel({
    required this.username,
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  factory ComentModel.fromJson(Map<String, dynamic> myjsonResponce) {
    return ComentModel(
        username: myjsonResponce['username'],
        id: myjsonResponce['id'],
        name: myjsonResponce['name'],
        email: myjsonResponce['email'],
        address: myjsonResponce['address']);
  }
}
