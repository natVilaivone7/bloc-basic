import 'package:paymentfronted/model/groscery_model.dart';

abstract class HomeEvent {}

class HomeInitializeActioneEvent extends HomeEvent {}

class HomeProdoctWishListButtomClickEvent extends HomeEvent {
  final ProductDataModel productDataModel;
  HomeProdoctWishListButtomClickEvent({required this.productDataModel});
}

class HomeProdoctCartButtomClickEvent extends HomeEvent {
  final ProductDataModel productDataModel;
  HomeProdoctCartButtomClickEvent({required this.productDataModel});
}

class HomeCartNavigateButtomClickEvent extends HomeEvent {}

class HomeWishListNavigateButtomClickEvent extends HomeEvent {}
