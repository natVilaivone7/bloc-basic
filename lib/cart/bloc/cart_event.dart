part of 'cart_bloc.dart';

abstract class CartEvent {}
 class CartAddToActionEvent extends CartEvent {}

class RemoveCartFromCartButtomEvent extends CartEvent {
  ProductDataModel productDataModel;
  RemoveCartFromCartButtomEvent({required this.productDataModel});
}
