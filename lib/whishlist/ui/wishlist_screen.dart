import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentfronted/whishlist/bloc/wishlist_bloc.dart';
import 'package:paymentfronted/whishlist/ui/wishlist_tile.cart.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(InitializedWishlistEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (pre, current) => current is WishlistActionSate,
        buildWhen: (pre, current) => current is! WishlistActionSate,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case SuccessFullwishlistState:
              final successfulstate = state as SuccessFullwishlistState;
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                child: ListView.builder(
                  itemCount: successfulstate.productDataModel.length,
                  itemBuilder: (BuildContext context, index) {
                    return WishlistTileWidgets(
                        productDataModel: successfulstate.productDataModel[index],
                        wishlistBloc: wishlistBloc);
                  },
                ),
              );
          }
          return Container();
        },
      ),
    );
  }
}
