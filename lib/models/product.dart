class Product {
  String id;
  String name;
  String title;
  String description;
  num rating;
  num price;
  String? imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  // factory Product.fromJson(query) {
  //   return Product(
  //     id: query.id,
  //     name: query['name'] as String,
  //     title: query['title'] as String,
  //     description: query['description'] as String,
  //     rating: query['rating'] as num, // Correct type casting
  //     price: query['price'] as num, // Correct type casting
  //     imageUrl: query['imageUrl'] as String?,
  //     categoryId: query['categoryId'] as String,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'title': title,
  //     'description': description,
  //     'rating': rating,
  //     'price': price,
  //     'imageUrl': imageUrl,
  //     'categoryId': categoryId,
  //   };
  // }
}
