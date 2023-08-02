class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Hotel", image: "assets/icons/hotel.png" ,   ),
  TouristPlacesModel(name: "Vol", image: "assets/icons/avion.png", ),
  TouristPlacesModel(name: "Voiture", image: "assets/icons/voiture.png", ),

];