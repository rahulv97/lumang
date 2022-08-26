import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_store/functions/passDataToProducts.dart';
import 'package:my_store/pages/product/product.dart';
import 'package:shimmer/shimmer.dart';

class GetCategoryProducts extends StatefulWidget {
  @override
  _GetCategoryProductsState createState() => _GetCategoryProductsState();
}

class _GetCategoryProductsState extends State<GetCategoryProducts> {
  bool _shimmer = true;

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _shimmer = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? (_shimmer)
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.white,
                    child: Container(
                      height: 245.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: InkWell(
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.7,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            height: 170.0,
                                            width: 170.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              image: DecorationImage(
                                                image: AssetImage(snapshot
                                                    .data[index].productImage),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            margin: EdgeInsets.all(6.0),
                                          ),
                                          Positioned(
                                            top: 0.0,
                                            left: 0.0,
                                            child: Container(
                                              padding: EdgeInsets.all(5.0),
                                              margin: EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomRight: Radius.circular(
                                                    10.0,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                  snapshot
                                                      .data[index].offerText,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            right: 6.0, left: 6.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[index].productTitle,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'Jost',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.6,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .color,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "\₹${snapshot.data[index].productPrice}",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        .color,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  width: 7.0,
                                                ),
                                                Text(
                                                  "\₹${snapshot.data[index].productOldPrice}",
                                                  style: TextStyle(
                                                      fontSize: 13.0,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.grey),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                        productData: PassDataToProduct(
                                          snapshot.data[index].productId,
                                          snapshot.data[index].productImage,
                                          snapshot.data[index].productTitle,
                                          snapshot.data[index].productPrice,
                                          snapshot.data[index].productOldPrice,
                                          snapshot.data[index].offerText,
                                          snapshot.data[index].uniqueId,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                  )
                : Container(
                    height: 245.0,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: InkWell(
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.7,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 170.0,
                                          width: 170.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: AssetImage(snapshot
                                                  .data[index].productImage),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          margin: EdgeInsets.all(6.0),
                                        ),
                                        Positioned(
                                          top: 0.0,
                                          left: 0.0,
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            margin: EdgeInsets.all(6.0),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                bottomRight: Radius.circular(
                                                  10.0,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                                snapshot.data[index].offerText,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          right: 6.0, left: 6.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            snapshot.data[index].productTitle,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Jost',
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.6,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .color,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "\₹${snapshot.data[index].productPrice}",
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      .color,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 7.0,
                                              ),
                                              Text(
                                                "\₹${snapshot.data[index].productOldPrice}",
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                      productData: PassDataToProduct(
                                        snapshot.data[index].productId,
                                        snapshot.data[index].productImage,
                                        snapshot.data[index].productTitle,
                                        snapshot.data[index].productPrice,
                                        snapshot.data[index].productOldPrice,
                                        snapshot.data[index].offerText,
                                        snapshot.data[index].uniqueId,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                  )
            : Center(
                child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                valueColor:
                    AlwaysStoppedAnimation<Color>(const Color(0xFFF1F3F6)),
              ));
      },
    );
  }
}

class Products {
  int productId;
  String productImage;
  String productTitle;
  String productPrice;
  String productOldPrice;
  String offerText;
  String uniqueId;

  Products(this.productId, this.productImage, this.productTitle,
      this.productPrice, this.productOldPrice, this.offerText, this.uniqueId);
}

Future<List<Products>> loadProducts() async {
  var jsonString =
      await rootBundle.loadString('assets/json/featured_products.json');
  final jsonResponse = json.decode(jsonString);

  List<Products> products = [];

  for (var o in jsonResponse) {
    Products product = Products(
        o["productId"],
        o["productImage"],
        o["productTitle"],
        o["price"],
        o["oldPrice"],
        o["offer"],
        o["uniqueId"]);

    products.add(product);
  }

  return products;
}
