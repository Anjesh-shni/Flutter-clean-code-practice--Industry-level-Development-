import 'dart:math';
import 'package:flutter/material.dart';

class MyData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "orderId": "# ${Random().nextInt(10000)}",
            "date": "21 july, 2023",
            "tableNo": "0${Random().nextInt(20)}",
            "amount": "Rs. ${Random().nextInt(3000)}",
            "paymentMethod": "Esewa",
            "manage": "...",
          });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]["orderId"].toString())),
      DataCell(Text(_data[index]["date"].toString())),
      DataCell(Text(_data[index]["tableNo"].toString())),
      DataCell(Text(_data[index]["amount"].toString())),
      DataCell(Text(_data[index]["paymentMethod"].toString())),
      DataCell(Text(_data[index]["manage"].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
