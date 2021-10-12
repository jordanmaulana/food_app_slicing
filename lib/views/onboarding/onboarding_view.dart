import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utility/colors.dart';
import 'package:food_app/widgets/text_widgets.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int preferedHeight = 812;
    double screenHeight = screenSize.height;
    double ratioHeight = screenHeight/preferedHeight;
    double screenWidth = screenSize.width;
    if(screenSize.width/screenHeight > 0.565){
      screenWidth = screenHeight * 0.565;
    }
    final List<String> imagesList = [
      "onboarding1.png",
      "onboarding2.png",
      "onboarding3.png",
    ];
    final List<String> titleList = [
      "Order from your favourite stores or vendors",
      "Choose from a wide range of  delicious meals",
      "Enjoy instant delivery and payment",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              children: [
                Container(
                  height: 23.25 * ratioHeight,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 48 * ratioHeight),
                CarouselSlider(
                  items: imagesList
                      .map(
                        (item) => Container(
                          child: Center(
                            child: Column(children: [
                              HeaderText(
                                '${titleList[imagesList.indexOf(item)]}',
                                maxLine: 2,
                                alignment: TextAlign.center,
                              ),
                              SizedBox(height: 20 * ratioHeight),
                              Flexible(
                                child: Image.asset(
                                  "assets/images/onboarding/$item",
                                  alignment: Alignment.center,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 430 * ratioHeight,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16 * ratioHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagesList.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? VColor.green
                            : Color(0xFFC4C4C4),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 45 * ratioHeight),
                Container(
                  height: 51 * ratioHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Create an account"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(VColor.orange1),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: () {
                      print("Create an account");
                    },
                  ),
                ),
                SizedBox(height: 20 * ratioHeight),
                Container(
                  width: double.infinity,
                  height: 51 * ratioHeight,
                  child: ElevatedButton(
                    child: Text("Login"),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(VColor.orange1),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      splashFactory: InkSplash.splashFactory,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0))),
                    ),
                    onPressed: () {
                      print("Login");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
