class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.description});
}
