import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentfronted/bloc/home_bloc.dart';
import 'package:paymentfronted/bloc/home_bloc_event.dart';
import 'package:paymentfronted/bloc/home_bloc_state.dart';
import 'package:paymentfronted/whishlist/ui/wishlist_screen.dart';
import 'package:paymentfronted/widgets/my_prodductl_list.dart';

import '../cart/ui/cart_sceen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitializeActioneEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (previouse, current) => current is! HomeActionSate,
        listenWhen: (previouse, current) => current is HomeActionSate,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageState) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const CartScreen()));
          } else if (state is HomeNavigateToWishListPageState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const WishListScreen()));
          } else if (state is HomeProduntsItemCartState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("item carted")));
          } else if (state is HomeProduntsItemWishListtState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("item wishlisted")));
          }
        },
        builder: (BuildContext context, state) {
          if (state is HomeInitailizeState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is HomeSuccessfullState) {
            final sucessState = state as HomeSuccessfullState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Groscery app"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishListNavigateButtomClickEvent());
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateButtomClickEvent());
                      },
                      icon: const Icon(
                        Icons.shop_outlined,
                        size: 30,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 20,
                  )
                ],
                backgroundColor: Colors.teal,
                elevation: 0,
              ),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 8, bottom: 8),
                  child: ListView.builder(
                    itemCount: sucessState.products.length,
                    itemBuilder: (BuildContext context, index) {
                      return myproductscreen(
                        productDataModel: sucessState.products[index],
                        homeBloc: homeBloc,
                      );
                    },
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
            ),
            body: Center(
              child: Text("Error"),
            ),
          );
        });
  }
}
