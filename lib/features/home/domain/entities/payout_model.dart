


class PayoutModel {
  final BigInt createdAt;
  final BigInt userId;
  final BigInt differentialIncome;
  final BigInt parallelIncome;
  final BigInt royaltyV3;
  final BigInt royaltyV5;
  final BigInt royaltyV7;
  final BigInt royaltyV3Count;
  final BigInt royaltyV5Count;
  final BigInt royaltyV7Count;
  final BigInt superIncome;
  final BigInt adminSuperIncomeTax;

  PayoutModel({
    required this.createdAt,
    required this.userId,
    required this.differentialIncome,
    required this.parallelIncome,
    required this.royaltyV3,
    required this.royaltyV5,
    required this.royaltyV7,
    required this.royaltyV3Count,
    required this.royaltyV5Count,
    required this.royaltyV7Count,
    required this.superIncome,
    required this.adminSuperIncomeTax,
  });

  factory PayoutModel.fromList(List data) {
    return PayoutModel(
      createdAt: data[0],
      userId: data[1],
      differentialIncome: data[2],
      parallelIncome: data[3],
      royaltyV3: data[4],
      royaltyV5: data[5],
      royaltyV7: data[6],
      royaltyV3Count: data[7],
      royaltyV5Count: data[8],
      royaltyV7Count: data[9],
      superIncome: data[10],
      adminSuperIncomeTax: data[11],
    );
  }
}