import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/product/product.dart';
import 'package:my_store/functions/passDataToProducts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedProducts extends StatefulWidget {
  @override
  _RecommendedProductsState createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
  bool _shimmer = true;

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => setState(() {
              _shimmer = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              AppLocalizations.of(context)
                  .translate('homePage', 'recommendedProductsString'),
              style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 17.0,
                  color: Theme.of(context).textTheme.headline6.color),
            ),
          ),
          FutureBuilder<List<Products>>(
            future: loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? (_shimmer)
                      ? Column(
                          children: <Widget>[
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.white,
                              child: ProductsGridView(products: snapshot.data),
                            ),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            ProductsGridView(products: snapshot.data),
                          ],
                        )
                  : Center(
                      child: SpinKitRipple(color: Colors.red),
                    );
            },
          )
        ],
      ),
    );
  }
}

class ProductsGridView extends StatefulWidget {
  final List<Products> products;

  ProductsGridView({Key key, this.products}) : super(key: key);

  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  InkWell getStructuredGridCell(Products products) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Hero(
                    tag: products.uniqueId,
                    child: Image.asset(
                      products.productImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            // Hero(
            //   tag: products.uniqueId,
            //   child: Container(
            //     // height: ((height - 150.0) / 2.95),
            //     height: 120.0,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.0),
            //       image: DecorationImage(
            //         image: AssetImage(products.productImage),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //     margin: EdgeInsets.all(6.0),
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 6.0, left: 6.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      products.productTitle,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Jost',
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "\₹${products.productPrice}",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 6.0,
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
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "(${products.offerText})",
                          style: TextStyle(
                              color: const Color(0xFF67A86B), fontSize: 14.0),
                        ),
                      ],
                    ),
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
                products.productId,
                products.productImage,
                products.productTitle,
                products.productPrice,
                products.productOldPrice,
                products.offerText,
                products.uniqueId,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      // childAspectRatio: ((width) / (height - 150.0)),
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
  final String uniqueId;

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
