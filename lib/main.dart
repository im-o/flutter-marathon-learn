import 'package:flutter/material.dart';
import 'package:linux_flutter/product_card.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: firstColor,
          ),
          body: ChangeNotifierProvider(
            create: (context) => ProductState(),
            child: Container(
              margin: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Consumer<ProductState>(
                  builder: (context, productState, _) => ProductCard(
                    imageURL:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-Q3jRKJPosZ1wn4aV-KhlebE2aAX9g3_p2w&usqp=CAU",
                    productName: "Buah-buahan Mix 10 kg",
                    productPrice: "Rp. 25.000",
                    productQuantity: productState.productQty,
                    notificationMessage: (productState.productQty > 5)
                        ? "You Got Discount 10%"
                        : "",
                    onIncrementTap: () => productState.productQty++,
                    onDecrementTap: () => productState.productQty--,
                    onAddCartTap: () => {},
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
