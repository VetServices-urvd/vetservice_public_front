
final ALL_SPECIALITES_CLINIQUES=[
'consultation générale', 'vaccination', 'radiographie', 'échographie',
  'nutrition', 'chirurgie', 'hospitalisation', 'analyses sanguines',
  'dentisterie', 'évaluation comportemental'
];

class Clinique {
  final String? cliniqueid;
  final String adresse;
  final int pos_long;
  final int pos_lat;
  final String tel;
  final String disponibilite;
  final String vetref;


  Clinique(this.cliniqueid, this.adresse,
      this.pos_long, this.pos_lat,
      this.tel, this.disponibilite,
      this.vetref);

  Clinique.fromJson(Map<String, dynamic> json)
      : cliniqueid = json['cliniqueid'],
        adresse = json['adresse'],
        tel = json['tel'],
        pos_long = json['pos_long'],
        pos_lat = json['pos_lat'],
        disponibilite = json['disponibilite'],
        vetref = json['vetref'];

  Map<String, dynamic> toJson() => {
    'cliniqueid': cliniqueid,
    'adresse': adresse,
    'tel':tel,
    'pos_long':pos_long,
    'pos_lat': pos_lat,
    'disponibilite': disponibilite,
    'vetref': vetref
  };
}