import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/order_payment/delivery_address.dart';
import 'package:my_store/pages/product/product_details.dart';
import 'package:my_store/pages/search.dart';
import 'package:page_transition/page_transition.dart';
import 'package:my_store/functions/passDataToProducts.dart';

// My Own Imports

class ProductPage extends StatefulWidget {
  final PassDataToProduct productData;

  ProductPage({Key key, this.productData}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool favourite = false;
  int cartItem = 3;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Locale myLocale = Localizations.localeOf(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.productData.title,
          style: TextStyle(
            fontFamily: 'Jost',
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
          ),
        ],
      ),
      body: ProductDetails(data: widget.productData),
      bottomNavigationBar: Material(
        elevation: 5.0,
        child: Container(
          color: Colors.white,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () => _displaySnackBarAddToCart(context),
                child: Container(
                  width: ((width) / 2),
                  height: 50.0,
                  alignment: Alignment.center,
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('productPage', 'addToCartString'),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline6.color,
                      fontSize: (myLocale.languageCode == 'id' ||
                              myLocale.languageCode == 'ru')
                          ? 10.5
                          : 15.0,
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Delivery()));
                },
                child: Container(
                  width: ((width) / 2),
                  height: 50.0,
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('productPage', 'buyNowString'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (myLocale.languageCode == 'id' ||
                              myLocale.languageCode == 'ru')
                          ? 10.5
                          : 15.0,
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _displaySnackBarAddToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      AppLocalizations.of(context)
          .translate('productPage', 'addedToCartString'),
      style: TextStyle(fontSize: 14.0),
    )));
  }
}
