class Category {
  final String slug;
  final String name;
  final String url;
  final String? imageUrl;

  Category({
    required this.slug,
    required this.name,
    required this.url,
    this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    slug: json['slug'] as String,
    name: json['name'] as String,
    url: json['url'] as String,
    imageUrl: json['imageUrl'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'slug': slug,
    'name': name,
    'url': url,
    'imageUrl': imageUrl,
  };
}
