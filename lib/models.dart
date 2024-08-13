
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
      idBeneficiary: json['IdBeneficiary'],
      nomComplet: json['NomComplet'],
      email: json['Email'],
      solde: json['Solde'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IdBeneficiary': idBeneficiary,
      'NomComplet': nomComplet,
      'Email': email,
      'Solde': solde,
    };
  }
}
