class Hotel {
  String id;
  String name;
  String cover;
  List<String> image;
  int price;
  String location;
  double rating;
  String description;
  List<Map<String, dynamic>> activities;
  String category;

  Hotel({
    required this.id,
    required this.name,
    required this.cover,
    required this.image,
    required this.price,
    required this.location,
    required this.rating,
    required this.description,
    required this.activities,
    required this.category,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        image: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        location: json["location"],
        rating: json["rating"]?.toDouble(),
        description: json["description"],
        activities: List<Map<String, dynamic>>.from(json["activities"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "image": List<dynamic>.from(image.map((x) => x)),
        "price": price,
        "location": location,
        "rating": rating,
        "description": description,
        "activities": activities,
        "category": category,
      };
}
