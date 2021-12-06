class ProductItem{
  final String imgPath;
  final String productName;
  final String resturent;
  final double  rating;
  final int likes;
  final double price;

  const ProductItem({
    required this.imgPath,
    required this.productName,
    required this.resturent,
    required this.rating,
    required this.likes,
    required this.price,
  });
}


class CatagoriesItem{
  final String imagePath;
  final String productItemName;

  CatagoriesItem({
    required this.imagePath,
    required this.productItemName,
});
}