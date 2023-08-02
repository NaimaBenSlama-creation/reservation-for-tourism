class RecommendedPlaceModel {
  final String image;
  final double rating;
  final String location;
  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    image: "assets/places/istanbul.jpg",
    rating: 4.4,
    location: "St. Istanbul",
  ),
  RecommendedPlaceModel(
    image: "assets/places/makka.jpg",
    rating: 4.4,
    location: "St. Omra",
  ),
  RecommendedPlaceModel(
    image: "assets/places/suisse.jpg",
    rating: 4.4,
    location: "St. Suisse",
  ),
  RecommendedPlaceModel(
    image: "assets/places/moscou.jpg",
    rating: 4.4,
    location: "St. Moscou",
  ),
  RecommendedPlaceModel(
    image: "assets/places/egypte.jpg",
    rating: 4.4,
    location: "St. Egypte",
  ),
  RecommendedPlaceModel(
    image: "assets/places/france.jpg",
    rating: 4.4,
    location: "St. France",
  ),
  RecommendedPlaceModel(
    image: "assets/places/dubai.jpg",
    rating: 4.4,
    location: "St. Dubai",
  ),
];
