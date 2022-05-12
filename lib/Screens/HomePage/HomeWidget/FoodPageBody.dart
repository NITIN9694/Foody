import 'package:flutter/material.dart';
import 'package:foody/Screens/HomePage/HomeWidget/Icon_and_text_widaget.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:foody/Widget/SmallText.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double _scalFactor = 0.8;
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 330,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: 5,
          position: currPageValue,
          decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          _scalFactor + (currPageValue - index + 1) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - _scalFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scalFactor) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(children: [
        Container(
          height: _height,
          margin: EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? AppColors.yellowColor : AppColors.mainColor,
              image: DecorationImage(
                  image: AssetImage("assets/pizza.jpg"), fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5),
              BoxShadow(
                offset: Offset(-5, 0),
                color: Colors.white,
              ),
            ], borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Chinese Side",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  size: 16,
                                  color: AppColors.mainColor,
                                )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "4.5",
                        color: AppColors.textcolor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: "1287",
                        size: 10,
                        color: AppColors.textcolor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(
                        text: "Comments",
                        size: 10,
                        color: AppColors.textcolor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon_and_Text(
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.yellowColor,
                          text: "Normal"),
                      Icon_and_Text(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: "1.7 Km"),
                      Icon_and_Text(
                          icon: Icons.access_time_outlined,
                          iconColor: AppColors.iconcolor2,
                          text: "32 min")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
