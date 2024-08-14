class BeneficiaryUser {
  final int idBeneficiary;
  final String nomComplet;
  final String email;
  final String solde;

  BeneficiaryUser({
    required this.idBeneficiary,
    required this.nomComplet,
    required this.email,
    required this.solde,
  });

  factory BeneficiaryUser.fromJson(Map<String, dynamic> json) {
    return BeneficiaryUser(
      idBeneficiary: json['specialId'],
      nomComplet: json['nomComplet'],
      email: json['email'],
      solde: json['solde'],
    );
  }
}

class History {
  final int id;
  final int idBeneficiary;
  final String action;
  final double montant;
  final String date;

  History({
    required this.id,
    required this.idBeneficiary,
    required this.action,
    required this.montant,
    required this.date,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      idBeneficiary: json['idBeneficiary'],
      action: json['action'],
      montant: json['montant'].toDouble(),
      date: json['date'],
    );
  }
}
