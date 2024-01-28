import 'package:paymentfronted/model/groscery_model.dart';

abstract class HomeState {}

abstract class HomeActionSate extends HomeState {}

class HomeInitailizeState extends HomeState {}

class HomeLoadingState extends HomeState {
  @override
  String toString() => "Loading State...";
}

class HomeErrorState extends HomeState {}

class HomeSuccessfullState extends HomeState {
  List<ProductDataModel> products = [];
  HomeSuccessfullState({required this.products});
}

class HomeNavigateToCartPageState extends HomeActionSate {}

class HomeNavigateToWishListPageState extends HomeActionSate {}

class HomeProduntsItemCartState extends HomeActionSate {}

class HomeProduntsItemWishListtState extends HomeActionSate {}
