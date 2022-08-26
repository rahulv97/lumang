import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_store/functions/passDataToProducts.dart';
import 'package:my_store/pages/product/product.dart';
import 'package:page_transition/page_transition.dart';

class GetSimilarProducts extends StatefulWidget {
  @override
  _GetSimilarProductsState createState() => _GetSimilarProductsState();
}

class _GetSimilarProductsState extends State<GetSimilarProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Products>>(
      future: loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? Container(
                height: 270.0,
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
                              color:
                                  Theme.of(context).appBarTheme.backgroundColor,
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
                                Hero(
                                  tag: snapshot.data[index].uniqueId,
                                  child: Container(
                                    height: 170.0,
                                    width: 170.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            snapshot.data[index].productImage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    margin: EdgeInsets.all(6.0),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin:
                                      EdgeInsets.only(right: 6.0, left: 6.0),
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
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        snapshot.data[index].offerText,
                                        style: TextStyle(
                                            color: const Color(0xFF67A86B),
                                            fontSize: 14.0),
                                        overflow: TextOverflow.ellipsis,
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
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                                child: ProductPage(
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

class SimilarProductsGridView extends StatefulWidget {
  final List<Products> products;

  SimilarProductsGridView({Key key, this.products}) : super(key: key);

  @override
  _SimilarProductsGridViewState createState() =>
      _SimilarProductsGridViewState();
}

class _SimilarProductsGridViewState extends State<SimilarProductsGridView> {
  Hero getStructuredGridCell(Products products) {
    double height = MediaQuery.of(context).size.height;
    return Hero(
      tag: '${products.productTitle}',
      child: InkWell(
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                // height: 185.0,
                height: ((height - 150.0) / 2.95),
                margin: EdgeInsets.all(6.0),
                child: Image(
                  image: AssetImage(products.productImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 6.0, left: 6.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      products.productTitle,
                      style: TextStyle(fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "\₹${products.productPrice}",
                          style: TextStyle(fontSize: 16.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Text(
                          "\₹${products.productOldPrice}",
                          style: TextStyle(
                              fontSize: 13.0,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      products.offerText,
                      style: TextStyle(
                          color: const Color(0xFF67A86B), fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      childAspectRatio: ((width) / (height - 150.0)),
      children: List.generate(widget.products.length, (index) {
        return getStructuredGridCell(widget.products[index]);
      }),
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
