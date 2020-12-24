class Item {
  final String id;
  final String name;
  final String image;
  final String categoryName;
  final String ingredients;
  final String description;
  final int harga;

  Item({this.id, this.name, this.image, this.categoryName, this.harga, this.ingredients, this.description});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      categoryName: json['categoryName'],
      harga: json['harga'],
      ingredients: json['ingredients'],
      description: json['description']
    );
  }
}