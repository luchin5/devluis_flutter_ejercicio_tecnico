class PlatilloModel {
  String id;
  String name;
  String description;
  double precio;
  String currency;
  bool vegetarian;

  PlatilloModel({
    required this.id,
    required this.name,
    required this.description,
    required this.precio,
    required this.currency,
    required this.vegetarian,
  });

  factory PlatilloModel.fromJson(Map<String, dynamic> json) {
    return PlatilloModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      precio: (json['price'] as num).toDouble(),
      currency: json['currency'],
      vegetarian: json['vegetarian'],
    );
  }
}
