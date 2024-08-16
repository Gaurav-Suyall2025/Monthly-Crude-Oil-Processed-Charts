
class OilData {
  final String month;
  final String year;
  final String oilCompany;
  final double quantity;

  OilData({
    required this.month,
    required this.year,
    required this.oilCompany,
    required this.quantity,
  });

  factory OilData.fromJson(Map<String, dynamic> json) {
    return OilData(
      month: json['_month_'] ?? '',
      year: json['year'] ?? '',
      oilCompany: json['oil_companies_'] ?? '',
      quantity: double.tryParse(json['quantity_000_metric_tonnes_'] ?? '0.0') ?? 0.0,
    );
  }
}
