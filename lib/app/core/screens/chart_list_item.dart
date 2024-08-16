
import 'package:flutter/material.dart';

class ChartListItem extends StatelessWidget {
  final String month;
  final String year;
  final String oilCompany;
  final String quantity;

  const ChartListItem({
    Key? key,
    required this.month,
    required this.year,
    required this.oilCompany,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.local_gas_station, color: Colors.white),
        ),
        contentPadding: EdgeInsets.all(16),
        title: Text(
          '$month $year',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '$oilCompany\nQuantity: $quantity Metric Tonnes',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
          ),
        ),
        isThreeLine: true,
      ),
    );
  }
}
