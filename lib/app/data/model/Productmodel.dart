class ProductModel {
  int? id;
  int? kapasitasmobil;

  int? transmisi;
  String? name;

  double? price;
  dynamic images;

  ProductModel(
      {this.id,
      this.name,
      this.transmisi,
      this.kapasitasmobil,
      this.price,
      this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['nama_mobil'],
      transmisi: json['transmisi'],
      kapasitasmobil: json['kapasitas_mobil'],
      price: json['harga_mobil'].toDouble(),
      images: json['urls'],
    );
  }
}
