import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_app/feature/presentation/pages/history_page/table_data.dart';
import 'package:pos_app/feature/presentation/reusable_widget/big_text.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import 'package:pos_app/utils/constant/app_colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController _searchController = TextEditingController();

  
   List<TableRawData>? filterData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "History",
              color: fontgrey,
              size: 16,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              height: size.height - 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: mainColorDark,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        width: size.width * .5,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: greyy,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  suffixIcon: Image.asset(
                                    "assets/dash_icon/search1.png",
                                    color: fontgrey,
                                    fit: BoxFit.contain,
                                    width: 15,
                                    height: 15,
                                  ),
                                  hintText: "Search by order Id",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  filled: true,
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  fillColor: greyy,
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 150,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: mainColorDark,
                          border: Border.all(color: buttonColor, width: 0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: fontgrey,
                              size: 14,
                            ),
                            SmallText(
                              text:
                                  "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}",
                              size: 9,
                              color: fontgrey,
                            ),
                            IconButton(
                              onPressed: () async {
                                DateTime? resultdate = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );
                                if (resultdate != null) {
                                  setState(() {
                                    selectedDate = resultdate;
                                  });
                                }
                              },
                              icon: Image.asset(
                                "assets/dash_icon/tick.png",
                                fit: BoxFit.contain,
                                width: 12,
                                height: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 410,
                    color: mainColorDark,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: DataTable(
                        columns: [
                          DataColumn(
                              label: SmallText(
                                  text: "Order Id", color: fontgrey, size: 12)),
                          DataColumn(
                              label: SmallText(
                                  text: "Date", color: fontgrey, size: 12)),
                          DataColumn(
                              label: SmallText(
                                  text: "Table ", color: fontgrey, size: 12)),
                          DataColumn(
                              label: SmallText(
                                  text: "Amout", color: fontgrey, size: 12)),
                          DataColumn(
                              label: SmallText(
                                  text: "Payment", color: fontgrey, size: 12)),
                          DataColumn(
                              label: SmallText(
                                  text: "Manage", color: fontgrey, size: 12)),
                        ],
                        rows: List.generate(
                          100,
                          (index) => orderDetails(index),
                        ),
                      ),
                    ),
                  ),
                  // PaginatedDataTable(
                  //   columns: [
                  //     DataColumn(
                  //         label: SmallText(
                  //             text: "Order Id", color: fontgrey, size: 12)),
                  //     DataColumn(
                  //         label: SmallText(
                  //             text: "Date", color: fontgrey, size: 12)),
                  //     DataColumn(
                  //         label: SmallText(
                  //             text: "Table ", color: fontgrey, size: 12)),
                  //     DataColumn(
                  //         label: SmallText(
                  //             text: "Amout", color: fontgrey, size: 12)),
                  //     DataColumn(
                  //         label: SmallText(
                  //             text: "Payment", color: fontgrey, size: 12)),
                  //     DataColumn(
                  //         label: SmallText(
                  //             text: "Manage", color: fontgrey, size: 12)),
                  //   ],
                  //   source: _data,
                  //   rowsPerPage: 6,
                  //   horizontalMargin: 50,
                  //   columnSpacing: 80,
                  //   initialFirstRowIndex: 1,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow orderDetails(int index) {
    return DataRow(
      cells: [
        DataCell(
          SmallText(
            text: "#${Random().nextInt(10000)}",
            size: 11,
            color: fontgrey,
          ),
        ),
        DataCell(
          SmallText(
            text: "23 july, 2023",
            size: 10,
            color: fontgrey,
          ),
        ),
        DataCell(
          SmallText(
            text: "${Random().nextInt(20)}",
            size: 10,
            color: fontgrey,
          ),
        ),
        DataCell(
          SmallText(
            text: "Rs.${Random().nextInt(10000)}",
            size: 10,
            color: fontgrey,
          ),
        ),
        DataCell(
          Container(
            height: 20,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index.isEven ? green : preparing,
            ),
            child: Center(
              child: SmallText(
                text: index.isOdd ? "Esewa" : "fonepay",
                size: 10,
                color: fontgrey,
              ),
            ),
          ),
        ),
        DataCell(
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: fontgrey,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
