import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:paymentfronted/data/cart_item.dart';

import 'package:paymentfronted/model/groscery_model.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialSate()) {
    on<CartAddToActionEvent>(cartActionEvent);
    on<RemoveCartFromCartButtomEvent>(_removeCartFromCartButtomEvent);
  }

  FutureOr<void> cartActionEvent(
      CartAddToActionEvent event, Emitter<CartState> emit) {
    emit(CartSuccessfullState(cartItemsproducts: cartItems));
  }

  FutureOr<void> _removeCartFromCartButtomEvent(
      RemoveCartFromCartButtomEvent event, Emitter<CartState> emit) {
  
    cartItems.remove(event.productDataModel);
    emit(CartRemoveActionSate());
    emit(CartSuccessfullState(cartItemsproducts: cartItems));
  }
}
