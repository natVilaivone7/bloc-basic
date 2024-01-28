import 'package:bloc/bloc.dart';
import 'package:paymentfronted/bloc/home_bloc_event.dart';
import 'package:paymentfronted/bloc/home_bloc_state.dart';
import 'package:paymentfronted/data/cart_item.dart';
import 'package:paymentfronted/data/data.dart';
import 'package:paymentfronted/data/wish_items.dart';
import 'package:paymentfronted/model/groscery_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitailizeState()) {
    on((HomeCartNavigateButtomClickEvent event, Emitter<HomeState> emit) {
      print("Cart Buttom Click");
      emit(HomeNavigateToCartPageState());
    });
    on((HomeWishListNavigateButtomClickEvent event, Emitter<HomeState> emit) {
      print("WishList Buttom Click");
      emit(HomeNavigateToWishListPageState());
    });
    // for click buttom
    on((HomeProdoctWishListButtomClickEvent event, Emitter<HomeState> emit) {
      print("Cart Buttom Click");
      wishListitems.add(event.productDataModel);
      emit(HomeProduntsItemWishListtState());
    });
    on((HomeProdoctCartButtomClickEvent event, Emitter<HomeState> emit) {
      print("WishLsit Buttom Click");
      cartItems.add(event.productDataModel);
      emit(HomeProduntsItemCartState());
    });

    on((HomeInitializeActioneEvent event, Emitter<HomeState> emit) {
      emit(HomeLoadingState());
      Future.delayed(Duration(seconds: 5));
      emit(HomeSuccessfullState(
          products: GrosceryData.itemList
              .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  image: e['image'],
                  description: e['description']))
              .toList()));
    });
  }
}
