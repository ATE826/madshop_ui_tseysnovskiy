class ProductCard {
  final String name;
  final String price;
  final String? colorSize; // может быть null, если не используется
  final String image;

  ProductCard({
    required this.name,
    required this.price,
    this.colorSize,
    required this.image,
  });
}
