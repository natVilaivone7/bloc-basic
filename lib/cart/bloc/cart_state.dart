part of 'cart_bloc.dart';

abstract class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitialSate extends CartState {}

class CartSuccessfullState extends CartState {
  final List<ProductDataModel> cartItemsproducts;
  CartSuccessfullState({required this.cartItemsproducts});
}

class CartRemoveActionSate extends CartActionState {}
