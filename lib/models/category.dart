class Category {
  final String id;
  final String name;
  final String image;
  final bool promo;

  Category({this.id, this.name, this.image, this.promo});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      promo: json['promo']
    );
  }
}