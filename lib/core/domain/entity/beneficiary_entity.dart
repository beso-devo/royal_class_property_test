class BeneficiaryEntity {
  static String className = "BeneficiaryEntity";

  final int id;
  final String nickName;
  final String phoneNumber;

  BeneficiaryEntity(
      {required this.id, required this.nickName, required this.phoneNumber});

  factory BeneficiaryEntity.fromJson(Map<String, dynamic> json) {
    return BeneficiaryEntity(
        id: json['id'],
        nickName: json['nick_name'],
        phoneNumber: json['phone_number']);
  }

  Map<String, dynamic> toJson(BeneficiaryEntity beneficiaryEntity) {
    return {
      'id': beneficiaryEntity.id,
      'nick_name': beneficiaryEntity.nickName,
      'phone_number': beneficiaryEntity.phoneNumber
    };
  }
}
