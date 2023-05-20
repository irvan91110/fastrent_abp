class userModel {
  int? id;
  String? nama;
  String? email;
  String? phone;

  userModel({
    this.id,
    this.nama,
    this.email,
    this.phone,
  });

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(
      id: json['id'],
      nama: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
