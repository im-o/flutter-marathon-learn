import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:linux_flutter/product_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Product> productList = [Product()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (BuildContext context) => ProductBloc(productList),
          child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text("Demo ListView Builder"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: firstColor, textStyle: TextStyle(color: Colors.white)),
            child: Text("Create Product"),
            onPressed: () => {bloc.add(r.nextInt(4) + 2)},
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (index == 0)
                          ? SizedBox(
                              width: 20,
                            )
                          : Container(),
                      ProductCard(
                        imageURL: products[index].imageURL,
                        productName: products[index].name,
                        productPrice: products[index].price.toString(),
                        onAddCartTap: () => {},
                        onIncrementTap: () => {},
                        onDecrementTap: () => {},
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Product {
  String imageURL;
  String name;
  int price;

  Product({this.imageURL = "", this.name = "", this.price = 0});
}

class ProductBloc extends Bloc<int, List<Product>> {
  ProductBloc(List<Product> initialState) : super(initialState);

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];
    for (int i = 0; i < event; i++)
      products.add(Product(
          imageURL: "https://booble.id/assets/images/08052021.png",
          name: "Product ${i.toString()}",
          price: (i + 1 * 2000)));
    yield products;
  }
}
