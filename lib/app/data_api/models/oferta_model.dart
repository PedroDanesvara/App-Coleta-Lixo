class OfertaModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  OfertaModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory OfertaModel.fromMap(Map<String, dynamic> mapped) {
    return OfertaModel(
      title: mapped['title'],
      description: mapped['description'],
      price: mapped['price'] * 1.0,
      rating: mapped['rating'] * 1.0,
      brand: mapped['brand'] * 1.0,
      category: mapped['category'] * 1.0,
      thumbnail: mapped['thumbnail'] * 1.0,
      images: List<String>.from((mapped['images'] as List)),
    );
  }
}