import 'dart:math';

class TableRawData {
  int? orderId;
  String? time;
  String? tableNo;
  double? amount;
  String? paymentStatus;

  TableRawData({
    this.orderId,
    this.time,
    this.tableNo,
    this.amount,
    this.paymentStatus,
  });

  // ignore: unused_field
  final List<TableRawData> _tabledata = [
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "21 july, 2023",
      tableNo: "",
      amount: 20.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "7 july, 2023",
      tableNo: "",
      amount: 20.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "8 july, 2023",
      tableNo: "",
      amount: 20.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "21 july, 2023",
      tableNo: "",
      amount: 450.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "18 july, 2023",
      tableNo: "",
      amount: 150.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "18 july, 2023",
      tableNo: "",
      amount: 20354.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "22 july, 2023",
      tableNo: "",
      amount: 4540.1,
      paymentStatus: "esewa",
    ),
    TableRawData(
      orderId: Random().nextInt(10000),
      time: "1 july, 2023",
      tableNo: "",
      amount: 1578.1,
      paymentStatus: "esewa",
    ),
  ];
}
