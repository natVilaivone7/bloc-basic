part of 'wishlist_bloc.dart';

abstract class WishlistState {}

abstract class WishlistActionSate extends WishlistState {}

final class WishlistInitialState extends WishlistState {}

class SuccessFullwishlistState extends WishlistState {
  final List<ProductDataModel> productDataModel;

  SuccessFullwishlistState({required this.productDataModel});
}

// class removewishlistState extends WishlistState{}
class additemsToCartScreenState extends WishlistActionSate {
}
