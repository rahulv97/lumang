import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/product/get_similar_products.dart';
import 'package:my_store/pages/product/product_size.dart';
import 'package:my_store/pages/product/rating_row.dart';

// My Own Imports

class ProductDetails extends StatefulWidget {
  final data;

  ProductDetails({Key key, this.data}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Color color = Theme.of(context).textTheme.headline6.color;

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        // Slider and Add to Wishlist Code Starts Here
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 2.0),
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: SizedBox(
                height: (height / 2.0),
                child: Hero(
                  tag: widget.data.uniqueId,
                  child: Carousel(
                    images: [
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath),
                      AssetImage(widget.data.imagePath)
                    ],
                    dotSize: 5.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.grey,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.0),
                    boxFit: BoxFit.fitHeight,
                    animationCurve: Curves.decelerate,
                    dotIncreasedColor: Colors.red,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                elevation: 3.0,
                onPressed: () {
                  setState(() {
                    if (!favourite) {
                      favourite = true;
                      color = Colors.red;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context).translate(
                                'productPage', 'addedtoWishlistString'),
                          ),
                        ),
                      );
                    } else {
                      favourite = false;
                      color = Colors.grey;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context).translate(
                                'productPage', 'removeFromWishlistString'),
                          ),
                        ),
                      );
                    }
                  });
                },
                child: Icon(
                  (!favourite)
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.solidHeart,
                  color: color,
                ),
              ),
            ),
          ],
        ),
        // Slider and Add to Wishlist Code Ends Here
        SizedBox(
          height: 8.0,
        ),
        Divider(
          height: 1.0,
        ),

        Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Product Title Start Here
              Text(
                '${widget.data.title}',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jost',
                  letterSpacing: 0.7,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
                textAlign: TextAlign.start,
              ),
              // Product Title End Here

              // Special Price badge Start Here
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  AppLocalizations.of(context)
                      .translate('productPage', 'specialPriceString'),
                  style: TextStyle(color: Colors.red[800], fontSize: 12.0),
                ),
              ),
              // Special Price badge Ends Here.

              // Price & Offer Row Starts Here
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '\₹${widget.data.price}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '\₹${widget.data.oldPrice}',
                      style: TextStyle(
                          fontSize: 14.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '₹${widget.data.offer}',
                      style: TextStyle(fontSize: 14.0, color: Colors.red[700]),
                    ),
                  ],
                ),
              ),
              // Price & Offer Row Ends Here

              // Rating Row Starts Here
              RatingRow(),
              // Rating Row Ends Here
            ],
          ),
        ),

        // Product Size & Color Start Here
        ProductSize(),
        // Product Size & Color End Here

        // Product Details Start Here
        Container(
          padding: EdgeInsets.all(10.0),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .translate('productPage', 'productDetailsString'),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jost',
                  letterSpacing: 0.7,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Color',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Length',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Type',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Sleeve',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Yellow',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Knee Length',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Bandage',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          'Cap Sleeve',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Product Details Ends Here

        // Product Description Start Here
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 5.0),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .translate('productPage', 'productDescriptionString'),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jost',
                  letterSpacing: 0.7,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Slip into this trendy and attractive dress from Rudraaksha and look stylish effortlessly. Made to accentuate any body type, it will give you that extra oomph and make you stand out wherever you are. Keep the accessories minimal for that added elegant look, just your favourite heels and dangling earrings, and of course, don\'t forget your pretty smile!',
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.45,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 5.0),
              Divider(
                height: 1.0,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)
                            .translate('productPage', 'viewMoreString'),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _productDescriptionModalBottomSheet(context);
                },
              ),
              Divider(
                height: 1.0,
              ),
            ],
          ),
        ),
        // Product Description Ends Here

        // Similar Product Starts Here
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppLocalizations.of(context)
                    .translate('productPage', 'similarProductsString'),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jost',
                  letterSpacing: 0.7,
                  color: Theme.of(context).textTheme.headline6.color,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              GetSimilarProducts(),
            ],
          ),
        ),
        // Similar Product Ends Here
      ],
    );
  }

  // Bottom Sheet for Product Description Starts Here
  void _productDescriptionModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).translate(
                              'productPage', 'productDescriptionString'),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Divider(
                          height: 1.0,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Slip into this trendy and attractive dress from Rudraaksha and look stylish effortlessly. Made to accentuate any body type, it will give you that extra oomph and make you stand out wherever you are. Keep the accessories minimal for that added elegant look, just your favourite heels and dangling earrings, and of course, don\'t forget your pretty smile!',
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 1.45,
                            color: Theme.of(context).textTheme.headline6.color,
                          ),
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 5,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Product Description Ends Here
}
