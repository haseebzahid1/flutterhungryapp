import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hungryapp/modal/ProductItem.dart';
import 'package:hungryapp/utils/button.dart';
import 'package:hungryapp/utils/constants.dart';
import 'package:hungryapp/utils/widget_functions.dart';
class ProductPage extends StatefulWidget {
  Map<String, dynamic>? productData;
  final ProductItem data;
  ProductPage({Key? key,  this.productData, required this.data}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // final GlobalKey<SlideActionState> _buttonKey = GlobalKey<SlideActionState>();
  bool addedToCart = false; // Just for Demonstration

  @override

  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
          body: LayoutBuilder(builder: (context, constraints){
            return Container(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      color: Colors.orange,
                      child: Column(
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.40,
                            child:Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe2f3d4),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    // "assets/images/${widget.productData['image']}",
                                    "assets/images/${widget.data.imgPath}",
                                    width: constraints.maxWidth * 0.50,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: SquareIconButton(
                                    icon:Icons.arrow_back_ios_outlined,
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    width: 50,
                                    buttonColor: Colors.orange.shade100,
                                    iconColor: Colors.orange,
                                  ),
                                ),
                              ],
                            ) ,
                          ),
                          addVerticalSpace(10),
                          Container(
                            color: Colors.grey.shade50,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      addVerticalSpace(20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Text("${widget.productData["name"]}",style: textTheme.headline5,),
                                              Text("${widget.data.productName}",style: textTheme.headline5,),
                                              RichText(
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(children:[
                                                  WidgetSpan(child: Icon(Icons.location_on,color: Colors.red, size: 15)),
                                                  // TextSpan(text: "${widget.productData["rest"]}",style: textTheme.subtitle2!.apply(color: COLOR_GREY)),
                                                  TextSpan(text: "${widget.data.resturent}",style: textTheme.subtitle2!.apply(color: COLOR_GREY)),
                                                ]),
                                              ),

                                            ],
                                          ),
                                          RichText(
                                              textAlign: TextAlign.right,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(children: [
                                                TextSpan(text: "\$", style: TextStyle(color: COLOR_ORANGE)),
                                                // TextSpan(text: "${widget.productData['price']}", style: textTheme.headline5!.apply(color: COLOR_ORANGE))
                                                TextSpan(text: "${widget.data.price}", style: textTheme.headline5!.apply(color: COLOR_ORANGE))
                                              ])),
                                        ],
                                      ),
                                      addVerticalSpace(20),
                                      Divider(),Container(
                                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(children: [
                                                  const WidgetSpan(child: Icon(Icons.star, color: Colors.orange, size: 15)),
                                                  // TextSpan(text: "${widget.productData['rating']}", style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                                  TextSpan(text: "${widget.data.rating}", style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                                ])),
                                            RichText(
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(children: [
                                                  const WidgetSpan(child: Icon(Icons.access_time_sharp, color: Colors.red, size: 15)),
                                                  TextSpan(text: " 18 Mins", style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                                ])),
                                            RichText(
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(children: [
                                                  const WidgetSpan(child: Icon(Icons.location_on, color: Colors.green, size: 15)),
                                                  TextSpan(text: "2.3 KM" , style: textTheme.bodyText2!.apply(fontWeightDelta: 4))
                                                ])),

                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Text(
                                        "Overview",
                                        style: textTheme.headline6,
                                      ),
                                      addVerticalSpace(10),
                                      Text(
                                        "A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, juicyfresh tomatoes and jalapeno - with extra cheese to go all around. A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes",
                                        style: textTheme.subtitle2!.apply(heightDelta: 2.0),
                                      ),
                                      addVerticalSpace(100),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -35,
                                  right: 20,
                                  child: InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(msg: "Added to Favorite");
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration:
                                      BoxDecoration(shape: BoxShape.circle, color: Colors.red, boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.2), blurRadius: 10.0, spreadRadius: 5.0)]),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            );
          }),
        ),
    );
  }
}
