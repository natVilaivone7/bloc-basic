import 'package:flutter/material.dart';
import 'package:paymentfronted/cart/bloc/cart_bloc.dart';

import 'package:paymentfronted/model/groscery_model.dart';

class CartTileWidgets extends StatelessWidget {
  CartBloc cartBloc = CartBloc();
  ProductDataModel productDataModel;

  CartTileWidgets({required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 320,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productDataModel.image,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${productDataModel.name}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
            Text(
              "${productDataModel.description.toString()}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${productDataModel.price.toString()}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {
                       
                          cartBloc.add(RemoveCartFromCartButtomEvent(
                              productDataModel: productDataModel));
                        },
                        icon: const Icon(
                          Icons.shop,
                          size: 30,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
