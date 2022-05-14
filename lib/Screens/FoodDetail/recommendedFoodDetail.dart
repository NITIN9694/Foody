import 'package:flutter/material.dart';
import 'package:foody/Screens/FoodDetail/FoodDetailesWidget/expanded_text_widget.dart';
import 'package:foody/Utils/Appcolor.dart';
import 'package:foody/Utils/Dimensions.dart';
import 'package:foody/Widget/AppIcon.dart';
import 'package:foody/Widget/BigText.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class recommendedFoodDetail extends StatefulWidget {
  const recommendedFoodDetail({Key? key}) : super(key: key);

  @override
  State<recommendedFoodDetail> createState() => _recommendedFoodDetailState();
}

class _recommendedFoodDetailState extends State<recommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              toolbarHeight: 90,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(iconData: Icons.clear),
                    AppIcon(iconData: Icons.shopping_cart_outlined)
                  ]),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppDimensions.radius20),
                            topRight: Radius.circular(AppDimensions.radius20))),
                    child: Center(
                        child: BigText(
                      text: "Siver Slide:",
                      size: AppDimensions.font26,
                    )),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                  )),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/secondimage.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: AppDimensions.width20,
                        right: AppDimensions.width20),
                    child: ExpandebleTextWidget(
                        text: "ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnls bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.snigedbofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.snigedsd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged. " +
                            "ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnls bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.snigedbofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.snigedsd y.sniged ied onionsfresn.noniand dec.cil.Aotc then. PRG.bofled lightlfjfkjkjjfdklj ljbsjklbdsjkld lk mlknsklnlkdsnklnl n nsllkn lnlssd y.sniged."),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: AppDimensions.width20 * 2.5,
                right: AppDimensions.width20 * 2.5,
                top: AppDimensions.heigth10,
                bottom: AppDimensions.heigth10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    iconData: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                  BigText(text: "\$12.88" + "X" + "0"),
                  AppIcon(
                    iconData: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                ],
              ),
            ),
            Container(
                height: AppDimensions.bottomHeightBar,
                padding: EdgeInsets.only(
                    top: AppDimensions.heigth20,
                    bottom: AppDimensions.heigth20,
                    left: AppDimensions.width10,
                    right: AppDimensions.width10),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.radius20 * 2),
                        topRight: Radius.circular(AppDimensions.radius20 * 2))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: AppDimensions.width20),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: AppDimensions.heigth20,
                              bottom: AppDimensions.heigth20,
                              left: AppDimensions.width10,
                              right: AppDimensions.width10),
                          child: BigText(
                            text: "\$18 Add to cart",
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: AppColors.mainColor)),
                    ])),
          ],
        ),
      ),
    );
  }
}
