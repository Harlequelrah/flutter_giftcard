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
