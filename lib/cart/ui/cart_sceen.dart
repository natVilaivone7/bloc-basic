import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentfronted/cart/bloc/cart_bloc.dart';
import 'package:paymentfronted/cart/ui/cart_tile_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cartBloc.add(CartAddToActionEvent());
    cartBloc.isClosed;
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (pre, cureent) => cureent is CartActionState,
        buildWhen: (pre, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartRemoveActionSate) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Removed")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessfullState:
              final sussessState = state as CartSuccessfullState;
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                child: ListView.builder(
                  itemCount: sussessState.cartItemsproducts.length,
                  itemBuilder: (BuildContext context, index) {
                    return CartTileWidgets(
                        productDataModel: sussessState.cartItemsproducts[index],
                        cartBloc: cartBloc);
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
