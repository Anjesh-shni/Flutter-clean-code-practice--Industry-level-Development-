import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/constant/app_colors.dart';
import '../../reusable_widget/custom_container_button.dart';
import '../../reusable_widget/small_text.dart';

class SidePage extends StatelessWidget {
  const SidePage({
    super.key,
    required this.size,
    required TextEditingController addNoteController,
  }) : _addNoteController = addNoteController;

  final Size size;
  final TextEditingController _addNoteController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: mainColorDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: preparing, width: 0.5),
                  ),
                  height: 20,
                  width: 70,
                  child: const Center(
                    child: Text(
                      "Table 001",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 20,
                  width: 70,
                  child: Center(
                    child: Text(
                      "Order #001",
                      style: TextStyle(
                          fontSize: 10, color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: preparing, width: 0.5),
                  ),
                  height: 20,
                  width: 70,
                  child: const Center(
                    child: Text(
                      "Dine in",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: preparing, width: 0.5),
                  ),
                  height: 20,
                  width: 70,
                  child: const Center(
                    child: Text(
                      "Take away",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainColor,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 12,
                          color: buttonColor,
                        ),
                      ),
                      const Text(
                        "1 person",
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: mainColor,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 12,
                          color: buttonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              endIndent: 10,
              indent: 10,
              color: fontgrey,
              thickness: 0.4,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "items",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Qty",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //cart list
            Container(
              color: const Color(0xff21202E),
              width: double.infinity,
              height: size.height - 170,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mainColorDark.withOpacity(0.4),
                      border: Border.all(
                        width: 0.1,
                        color: fontgrey,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/food.png",
                                fit: BoxFit.cover,
                                width: 35,
                                height: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(
                              text: "Spicy Noodles",
                              size: 12,
                              color: fontgrey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              width: 60,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainColor,
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "\$ 50",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 9),
                              decoration: BoxDecoration(
                                color: const Color(0xff2D303E),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 24,
                              width: 180,
                              child: TextField(
                                controller: _addNoteController,
                                decoration: InputDecoration(
                                  hintText:
                                      "please just a little bit spicy only",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  filled: true,
                                  hintStyle: GoogleFonts.inter(
                                    color: fontgrey,
                                    fontSize: 9,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  // contentPadding: const EdgeInsets.only(
                                  //     bottom: 5, left: 10),
                                  fillColor: const Color(0xff2D303E),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: false,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/dash_icon/delete1.png",
                              color: buttonColor,
                              fit: BoxFit.contain,
                              width: 25,
                              height: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            CustomButtonC(
              text: "Print to kitchen",
              color: buttonColor,
              height: 28,
              onTap: () {},
              width: double.maxFinite,
            )
          ],
        ),
      ),
    );
  }
}
