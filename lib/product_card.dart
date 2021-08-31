import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color firstColor = Color(0xfff44336);
const Color secondColor = Color(0xff4caf50);

class ProductCard extends StatelessWidget {
  final int productQuantity;
  final String imageURL;
  final String productName;
  final String productPrice;
  final String notificationMessage;

  final Function onAddCartTap;
  final Function onIncrementTap;
  final Function onDecrementTap;

  ProductCard(
      {this.imageURL = "",
      this.productName = "",
      this.productPrice = "",
      this.notificationMessage = "",
      this.productQuantity = 0,
      required this.onIncrementTap,
      required this.onDecrementTap,
      required this.onAddCartTap});

  final TextStyle textStyle = TextStyle(
      fontFamily: "Lato",
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.grey[800]);

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    primary: firstColor,
    textStyle: TextStyle(fontSize: 12),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            duration: Duration(milliseconds: 300),
            width: 130,
            height: (notificationMessage.isNotEmpty) ? 260 : 240,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      offset: Offset(1, 1),
                      color: Colors.black.withOpacity(0.3))
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                color: secondColor),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                (notificationMessage.isNotEmpty) ? notificationMessage : "",
                style: textStyle.copyWith(color: Colors.white, fontSize: 12),
              ),
            )),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      image: DecorationImage(
                          image: NetworkImage(imageURL), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(productPrice,
                        style: textStyle.copyWith(
                            fontSize: 12, color: firstColor)),
                  )
                ],
              ),

              // Bottom
              Column(
                children: [
                  // button - +
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: firstColor),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => onDecrementTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          productQuantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: () => onIncrementTap(),
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // button cart
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () => onAddCartTap(),
                      //color: firstColor,
                      style: buttonStyle,
                      child: Icon(
                        Icons.add_shopping_cart,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;
  int get productQty => _quantity;

  set productQty(int value) {
    debugPrint('Testing value : $value');
    _quantity = value;
    notifyListeners();
  }
}
