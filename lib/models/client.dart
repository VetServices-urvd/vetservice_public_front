class CLient {
  final String? email;
  final String nom;
  final String prenom;
  final String mdp;
  final String adresse_perso;
  final String tel_perso;
  final String? clinique_favoris;


  CLient(this.email, this.nom,
      this.prenom, this.mdp,
      this.adresse_perso, this.tel_perso,
      this.clinique_favoris);

  CLient.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        prenom = json['prenom'],
        nom = json['nom'],
        mdp = json['mdp'],
        adresse_perso = json['adresse_perso'],
        tel_perso = json['tel_perso'],
        clinique_favoris = json['clinique_favoris'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'prenom': prenom,
    'nom':nom,
    'mdp':mdp,
    'adresse_perso': adresse_perso,
    'tel_perso': tel_perso,
    'clinique_favoris': clinique_favoris
  };
}