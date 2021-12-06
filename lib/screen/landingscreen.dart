import 'package:flutter/material.dart';
import 'package:hungryapp/modal/ProductItem.dart';
import 'package:hungryapp/screen/productitem.dart';
import 'package:hungryapp/screen/productpage.dart';
import 'package:hungryapp/utils/constants.dart';
import 'package:hungryapp/utils/widget_functions.dart';

// const PRODUCT_DATA = [
//   {"image": "pizza.png", "name": "Pizza", "rest": "Maritine Star Restaurant", "rating": "4.5 (164)", "price": 20, "currency": "\$"},
//   {"image": "burger.png", "name": "Burger", "rest": "Maritine Star Restaurant", "rating": "4.7 (199)", "price": 10, "currency": "\$"},
//   {"image": "fries.png", "name": "Fries", "rest": "Maritine Star Restaurant", "rating": "4.2 (101)", "price": 10, "currency": "\$"},
//   {"image": "hotdog.png", "name": "HotDog", "rest": "Maritine Star Restaurant", "rating": "3.9 (150)", "price": 15, "currency": "\$"},
// ];

  List<ProductItem> productItemList = [
    const ProductItem(imgPath:"pizza.png",productName:"Pizza",resturent: "Maritine Star Restaurant",rating: 4.5,likes: 164,price: 20 ,),  //instance of "ProductItem"
    const ProductItem(imgPath:"burger.png",productName:"Burger",resturent: "Maritine Star Restaurant",rating: 4.7,likes: 199,price: 20 ,),
    const ProductItem(imgPath:"fries.png",productName:"Fries",resturent: "Maritine Star Restaurant",rating: 4.2,likes: 101,price: 10 ,),
    const ProductItem(imgPath:"hotdog.png",productName:"HotDog",resturent: "Maritine Star Restaurant",rating: 3.9,likes: 150,price: 15 ,),
];
// const CATEGORIES = [
//   {"image": "salad.png", "name": "Salad"},
//   {"image": "fastfood.png", "name": "Fast Food"},
//   {"image": "desert.png", "name": "Desert"},
//   {"image": "drinks.png", "name": "Drinks"},
//   {"image": "drinks.png", "name": "Drinks"},
// ];

List<CatagoriesItem> catagoriesItemList = [
   CatagoriesItem(imagePath: "salad.png", productItemName: "Salad"),
   CatagoriesItem(imagePath: "fastfood.png", productItemName: "Fast Food"),
   CatagoriesItem(imagePath: "desert.png", productItemName: "Desert"),
   CatagoriesItem(imagePath: "drinks.png", productItemName: "Drinks"),
   CatagoriesItem(imagePath: "salad.png", productItemName: "Salad"),
];


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final FocusNode _focusNode = FocusNode();
  //////////////////////
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
///////////////////////
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
       body: LayoutBuilder(builder: (context, constraints){
         return Container(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   height: constraints.maxHeight * 0.40, /////note
                   child: Stack(
                     fit: StackFit.expand,
                     children: [
                       Container(
                         color: COLOR_GREEN,
                       ),
                       Image.asset("assets/images/tree_v.png"),
                       Padding(
                         padding: const EdgeInsets.all(10),
                         child: (
                             Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                       width: 70,
                                       decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(20.0),
                                       ),
                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Image.asset("assets/images/avatar.png"),
                                       ),
                                     ),
                                     addHorizontalSpace(20),
                                     Expanded(
                                       child: Text("How Hungry are you Today?",
                                       style: textTheme.headline5!.apply(color: Colors.white),
                                       ),
                                     ),
                                   ],
                                 ),
                                 TextFormField(
                                   focusNode: _focusNode,
                                   cursorColor: Colors.white,
                                   cursorRadius: const Radius.circular(10.0),
                                   style: const TextStyle(color: Colors.white),
                                   decoration: InputDecoration(
                                       hintText: "Search Food Items",
                                       hintStyle: const TextStyle(color: Colors.white),
                                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
                                       prefixIcon: const Icon(
                                         Icons.search,
                                         color: Colors.white,
                                       ),
                                       suffixIcon: Container(
                                         height: 70,
                                         width: 70,
                                         decoration: const BoxDecoration(color: Colors.white24,
                                             borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
                                         child: const Icon(
                                           Icons.menu,
                                           color: Colors.white,
                                         ),
                                       ),
                                       filled: true,
                                       fillColor: Colors.white24),
                                 ),
                                 addVerticalSpace(10),
                               ],
                             )
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   width: constraints.maxWidth,
                   color: Colors.grey.shade200,
                   //height: 400,    //////note
                   child:
                   Padding(
                     padding: const EdgeInsets.only(
                       left: 10.0,
                       bottom: 10.0
                     ),
                     child: Stack(
                       clipBehavior: Clip.none,
                       children: [
                         Column(
                           children: [
                           addVerticalSpace(constraints.maxWidth*0.35),   /////note
                             Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Popular Foods",style: textTheme.headline5,),
                                 Expanded(child: Center()),
                                 Text("View All > ", style: textTheme.subtitle2!.apply(color: COLOR_ORANGE),
                                 ),
                               ],
                             ),
                                 addHorizontalSpace(10),
                             SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               physics: BouncingScrollPhysics(),
                               child: Row(
                                 children: productItemList.map((data) =>
                                     ProductItemWidget(
                                       width: constraints.maxWidth * 0.50,
                                       data: data,
                                     )
                                 ).toList(),

                                 // children: PRODUCT_DATA.map((data) => InkWell(
                                 //   onTap: () {
                                 //     _focusNode.unfocus();
                                 //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(productData: data,)));  //note  width 4/3  puch na ha
                                 //   },
                                 //   child: ProductItemWidget(
                                 //     width: constraints.maxWidth * 0.50,
                                 //     productData: data,
                                 //
                                 //   ),
                                 // ))
                                 //     .toList(),


                               ),
                             ),
                           ],
                         ),
                         Positioned(
                           top: -40,
                           left: 0,
                             child: Builder(
                               builder: (context) {
                                 return Container(
                                   width: constraints.maxWidth,
                                   height: constraints.maxWidth * 0.35,    ////note
                                   child: ListView(
                                     scrollDirection: Axis.horizontal,
                                     physics: BouncingScrollPhysics(),
                                     children: catagoriesItemList.map((category) => Container(
                                       margin: EdgeInsets.only(right: 10.0),
                                       width: constraints.maxWidth * 0.25,
                                       decoration:BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(20.0),
                                       ),
                                       child: Column(
                                         children: [
                                           Image.asset("assets/images/${category.imagePath}"),
                                           addVerticalSpace(10),
                                           Text(
                                             "${category.productItemName}",
                                             style: textTheme.bodyText2!.apply(color: COLOR_BLACK),
                                           )
                                         ],
                                       ),
                                     )).toList(),
                                   ),
                                 );
                               }
                             ),
                         ),
                       ],
                     ),
                   ),

                 ),
               ],
             ),
           ),
         );
       }),
    );
  }
}
