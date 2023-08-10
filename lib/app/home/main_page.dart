import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_app/core/snackbar.dart';
import 'package:pos_app/feature/presentation/reusable_widget/small_text.dart';
import 'package:pos_app/utils/constant/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Evakon Restro",
                      style: GoogleFonts.roboto(fontSize: 21, color: fontgrey),
                    ),
                    SmallText(
                      text: "Tuesday, 2 Feb 2021",
                      size: 13,
                      color: fontgrey,
                    ),
                  ],
                ),
                //

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: 200,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: greyy,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/dash_icon/search1.png",
                        color: fontgrey,
                        fit: BoxFit.contain,
                        width: 18,
                        height: 18,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: "search for food, coffe, etc..",
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
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: pending.withOpacity(0.6)),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_left,
                      color: fontgrey,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: mainColor,
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            TopSnackbar.show(context, "Category tapped");
                          },
                          child: index == 0
                              ? Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: mainColorDark,
                                  ),
                                  child: SmallText(
                                    text: "All",
                                    size: 12,
                                    color: fontgrey,
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: mainColorDark,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/burger1.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "coffee",
                                        style: GoogleFonts.barlow(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.8),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 160,
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 29,
                          child: Container(
                            width: 160,
                            height: 170,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF1F1D2B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 70.85,
                          top: 155,
                          child: SizedBox(
                            width: 32.95,
                            child: SmallText(
                              text: "\$ 20",
                              size: 9,
                              color: fontgrey.withOpacity(0.6),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 52.92,
                          top: 124,
                          child: Center(
                            child: SmallText(
                              text: "Spicy Seasoned \nseafood noodles",
                              size: 10,
                              color: fontgrey.withOpacity(0.8),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20.68,
                          // top: 0.01,
                          child: SizedBox(
                            width: 124.74,
                            height: 121.20,
                            child: Stack(
                              children: [
                                //
                                Positioned(
                                  left: -5.52,
                                  top: -0.77,
                                  child: Container(
                                    width: 130.38,
                                    height: 114.66,
                                    decoration: const BoxDecoration(),
                                    child: Image.asset(
                                      "assets/food.png",
                                      fit: BoxFit.contain,
                                      width: 60,
                                      height: 48,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 52.22,
                          top: 170,
                          child: SmallText(
                            text: "20 bowl available",
                            size: 9,
                            color: fontgrey.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
