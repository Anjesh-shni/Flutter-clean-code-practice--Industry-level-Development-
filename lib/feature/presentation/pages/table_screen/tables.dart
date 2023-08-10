import 'package:flutter/material.dart';
import 'package:pos_app/feature/presentation/reusable_widget/custom_container_button.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import 'package:pos_app/utils/constant/icons_list.dart';
import '../../../../utils/constant/app_colors.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Table> tables = [];
  List<Reservation> reservations = [];
  int _selectedIndex = -1;
  int _selectedIndexlonge = -1;
  int _selectedIndexReserve = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Simulating fetching data for tables and reservations
    tables = [
      Table('Table 001'),
      Table('Table 002'),
      Table('Table 003'),
    ];

    reservations = [
      Reservation('Reservation 1'),
      Reservation('Reservation 2'),
      Reservation('Reservation 3'),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 35,
            decoration: BoxDecoration(
              color: mainColorDark,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TabBar(
              labelColor: fontgrey,
              unselectedLabelColor: buttonColor,
              indicatorColor: button,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
              ),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "Tables",
                ),
                Tab(
                  text: "Reservation",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: mainColor,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .6,
            // color: pending,
            child: TabBarView(controller: _tabController, children: [
              //
              GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 30.0,
                  childAspectRatio: 1.6,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                        color: mainColorDark,
                        border: Border.all(
                          color: _selectedIndex == index
                              ? buttonColor
                              : whatsppColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Table 00${index + 1}"),
                            const Divider(
                              color: chatBackGround,
                              thickness: .5,
                              endIndent: 30,
                              indent: 30,
                            ),
                            Container(
                              height: 20,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: index.isEven ? completed : pending,
                              ),
                              child: Center(
                                child: SmallText(
                                  text: "Available",
                                  color: index.isEven
                                      ? Colors.grey.shade400
                                      : preparing,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              //
              GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 30.0,
                  childAspectRatio: 1.6,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndexReserve = index;
                      });
                    },
                    child: index == 0
                        ? InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: mainColorDark,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              height: 80,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 22,
                                    color: fontgrey,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SmallText(
                                    text: "Add reservation",
                                    size: 12,
                                    color: fontgrey,
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 80,
                            decoration: BoxDecoration(
                              color: mainColorDark,
                              border: Border.all(
                                color: _selectedIndexReserve == index
                                    ? buttonColor
                                    : whatsppColor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Table 00${index + 1}"),
                                  const Divider(
                                    color: chatBackGround,
                                    thickness: .5,
                                    endIndent: 30,
                                    indent: 30,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: index.isEven ? completed : pending,
                                    ),
                                    child: Center(
                                      child: SmallText(
                                        text: "Available",
                                        color: index.isEven
                                            ? Colors.grey.shade400
                                            : preparing,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  );
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: List.generate(
              4,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndexlonge = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _selectedIndexlonge == index
                          ? buttonColor
                          : whatsppColor,
                      width: 1,
                    ),
                    image: DecorationImage(
                      image: AssetImage(iconListTable[index]),
                      fit: BoxFit.cover,
                    ),
                    color: mainColorDark,
                  ),
                  // child: ,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {},
              child: CustomButtonC(
                  width: 150,
                  text: "Next",
                  color: buttonColor,
                  height: 30,
                  onTap: () {}),
            ),
          )
        ],
      ),
    );
  }
}

class Table {
  final String name;

  Table(this.name);
}

class Reservation {
  final String name;

  Reservation(this.name);
}
