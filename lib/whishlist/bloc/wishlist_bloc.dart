import 'package:bloc/bloc.dart';
import 'package:paymentfronted/model/groscery_model.dart';

import '../../data/wish_items.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on((InitializedWishlistEvent event, Emitter<WishlistState> emit) {
      emit(SuccessFullwishlistState(productDataModel: wishListitems));
    });
    on((addwishlistToCartScreenEvent event, Emitter<WishlistState> emit) {
      print("addToCartScreen");
      wishListitems.add(event.productDataModel);
      emit(additemsToCartScreenState());
    });
  }
}
