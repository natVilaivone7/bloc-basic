part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class InitializedWishlistEvent extends WishlistEvent {}

// class RemovewishlistEvent extends WishlistEvent {
//   final ProductDataModel productDataModel;
//   RemovewishlistEvent({required this.productDataModel});
// }

class addwishlistToCartScreenEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  addwishlistToCartScreenEvent({required this.productDataModel});
}
