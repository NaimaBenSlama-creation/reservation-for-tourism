class voiture {
  final String IMAGE;
  final String NOM;
  final String BOITE;
  final String NOMBREDEPLACES;

  final String ENERGIE;

  final String prix;


  voiture({
    required this.IMAGE,
    required this.NOM,
    required this.NOMBREDEPLACES,
    required this.BOITE,
    required this.prix,
    required this.ENERGIE,

  });

  voiture.fromJson(Map<dynamic, dynamic>map, this.IMAGE, this.NOM, this.BOITE,
      this.NOMBREDEPLACES, this.ENERGIE, this.prix) {
    if (map == null) {
      return;
    }
    prix:
    map["prix"];
    IMAGE:
    map["IMAGE"];
    NOM:
    map["NOM"];
    NOMBREDEPLACES:
    map["NOMBREDEPLACES"];
    BOITE:
    map["BOITE"];
    ENERGIE:
    map["ENERGIE"];
  }

  toJson() {
    return {
      "NOM": NOM,
      " NOMBREDEPLACES": NOMBREDEPLACES,
      "IMAGE": IMAGE,
      "prix": prix,
      "ENERGIE": ENERGIE,
      "BOITE": BOITE,

    };
  }
}