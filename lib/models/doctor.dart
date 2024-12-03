class Doctor {
  final String name;
  final String specialization;
  final String clinic;
  final double rating;
  final int reviews;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.specialization,
    required this.clinic,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      clinic: json['clinic'],
      rating: json['rating'],
      reviews: json['reviews'],
      imageUrl: json['imageUrl'],
    );
  }
}
