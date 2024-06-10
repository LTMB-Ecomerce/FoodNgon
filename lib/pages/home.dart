import 'package:flutter/material.dart';
import 'package:food/pages/details.dart';
import 'package:food/widgets/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, milktea = false, burger = false, chicken = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome Hoàng Anh,",
                    style: AppWidget.boldTextFeildStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            Text("Food Ngon", style: AppWidget.HeadlineTextFeildStyle()),
            Text("Spice things up and discover ",
                style: AppWidget.LightTextFeildStyle()),
            SizedBox(height: 20.0),
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/salad.png",
                                  width: 190, height: 150, fit: BoxFit.cover),
                              Text(
                                "Veggie Taco Hash",
                                style: AppWidget.semiBooldTextFeildStyle(),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Fresh and Healthy",
                                style: AppWidget.LightTextFeildStyle(),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\$25",
                                style: AppWidget.semiBooldTextFeildStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/salad.png",
                                width: 190, height: 150, fit: BoxFit.cover),
                            Text(
                              "Veggie Taco Hash",
                              style: AppWidget.semiBooldTextFeildStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Fresh and Healthy",
                              style: AppWidget.LightTextFeildStyle(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "\$25",
                              style: AppWidget.semiBooldTextFeildStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // Wrap content in a Column
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.0, left: 5.0),
                    child: Material(
                      elevation: 9.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/salad.png",
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Salad food with majone",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Honey good cheese",
                                    style: AppWidget.LightTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "\$28",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  // Add another container with similar structure here if needed
                  Container(
                    margin: EdgeInsets.only(right: 20.0, left: 5.0),
                    child: Material(
                      elevation: 9.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/salad.png",
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Salad food with majone",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Honey good cheese",
                                    style: AppWidget.LightTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "\$28",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            milktea = false;
            burger = false;
            chicken = false;
            setState(() {});
          },
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream
                      ? const Color.fromARGB(255, 190, 87, 98)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "images/ice-cream.png",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            milktea = true;
            burger = false;
            chicken = false;
            setState(() {});
          },
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  color: milktea
                      ? const Color.fromARGB(255, 190, 87, 98)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "images/bubble-tea.png",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            milktea = false;
            burger = true;
            chicken = false;
            setState(() {});
          },
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  color: burger
                      ? const Color.fromARGB(255, 190, 87, 98)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "images/burger.png",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            milktea = false;
            burger = false;
            chicken = true;
            setState(() {});
          },
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  color: chicken
                      ? const Color.fromARGB(255, 190, 87, 98)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "images/chicken.png",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
