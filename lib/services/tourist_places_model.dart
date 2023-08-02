class TouristPlacesModel {
  final String adresse;
  final String nom;
  final String etoile;
  final String image ;
  final String ville ;
  final String prix ;
  TouristPlacesModel({
    required this.adresse,
    required this.nom,
    required this.image,
    required this.etoile,
    required this.prix,
    required this.ville,
  });


factory TouristPlacesModel.fromJson(Map<String, dynamic> parsedjson) {
return TouristPlacesModel(
prix: parsedjson["prix"],
ville: parsedjson["ville"]  ,
etoile: parsedjson["etoile"],
image: parsedjson["image"],
nom: parsedjson["nom"],
adresse: parsedjson["adresse"],



);



}
Map<String, dynamic> toJson() {
return {

"nom": nom,
"adresse": adresse,
"image": image,
"prix": prix,
"ville": ville,
};
}



}