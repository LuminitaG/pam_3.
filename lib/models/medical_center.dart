class MedicalCenter {
  final String name;
  final String address;
  final String imageUrl;
  final double rating;

  MedicalCenter({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.rating,
  });

  // Metodă pentru a crea un MedicalCenter dintr-un JSON
  factory MedicalCenter.fromJson(Map<String, dynamic> json) {
    return MedicalCenter(
      name: json['name'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}

