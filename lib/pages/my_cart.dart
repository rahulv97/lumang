import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// My Own Import
import 'package:my_store/pages/home/home.dart';
import 'package:my_store/pages/order_payment/delivery_address.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int cartItem = 1;

  final cartItemList = [
    {
      'title': 'JBL Headphone',
      'image': 'assets/products/product_9.jpg',
      'price': 84
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return (cartItem == 0)
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                "My Cart",
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: 1.7,
                ),
              ),
              titleSpacing: 0.0,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/empty_bag.png',
                    height: 170.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    AppLocalizations.of(context)
                        .translate('cartPage', 'soLightString'),
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    AppLocalizations.of(context)
                        .translate('cartPage', 'nothingCartString'),
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 15.0, left: 15.0),
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('cartPage', 'addItemToCartString'),
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Jost',
                            fontSize: 16.0,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "My Cart",
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: 1.7,
                ),
              ),
              titleSpacing: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: ListView.builder(
                itemCount: cartItemList.length,
                itemBuilder: (context, index) {
                  final item = cartItemList[index];
                  return Container(
                    alignment: Alignment.center,
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      secondaryActions: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 5.0,
                            bottom: 5.0,
                          ),
                          child: IconSlideAction(
                            caption: AppLocalizations.of(context)
                                .translate('cartPage', 'deleteString'),
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              setState(() {
                                cartItemList.removeAt(index);
                                cartItem = cartItem - 1;
                              });

                              // Then show a snackbar.
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                AppLocalizations.of(context)
                                    .translate('cartPage', 'itemRemoved'),
                              )));
                            },
                          ),
                        ),
                      ],
                      child: Container(
                        height: 215,
                        width: (width - 10.0),
                        child: Card(
                          elevation: 3.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120.0,
                                          height: 125.0,
                                          child: Image(
                                            image: AssetImage(item['image']),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      // width: (width - 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '${item['title']}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .color,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'Price:',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '\₹${item['price']}',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      .color,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7.0,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, right: 8.0, left: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${AppLocalizations.of(context).translate('cartPage', 'totalString')} : ',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .color,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          Text(
                                            '\₹84',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .color,
                                              fontSize: 19.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .rightToLeft,
                                                  child: Delivery()));
                                        },
                                        child: Container(
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          width: 120.0,
                                          height: 40.0,
                                          alignment: Alignment.center,
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .translate(
                                                    'cartPage', 'payString'),
                                            style: TextStyle(
                                              fontSize: 19.0,
                                              fontFamily: 'Jost',
                                              letterSpacing: 1.5,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .appBarTheme
                                                  .backgroundColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
