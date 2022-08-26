import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final cartItemList = [
    {
      'status': 1,
      'title': 'JBL Headphone',
      'image': 'assets/products/product_9.jpg',
      'price': 84
    },
    {
      'status': 2,
      'title': 'Ladies Bag',
      'image': 'assets/products/product_7.jpg',
      'price': 77
    },
    {
      'status': 3,
      'title': 'White Ladies Bag',
      'image': 'assets/products/product_4.jpg',
      'price': 30
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;

    Locale myLocale = Localizations.localeOf(context);

    Container _checkStatus(status) {
      // status 1 => Out for Delivery
      // status 2 => Shipped
      // status 3 => Delivered

      if (status == 1) {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    (myLocale.languageCode == 'ar') ? 0.0 : 5.0),
                topLeft: Radius.circular(
                    (myLocale.languageCode == 'ar') ? 5.0 : 0.0)),
          ),
          child: Text(
            AppLocalizations.of(context)
                .translate('myOrderPage', 'outOfDeliveryString'),
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      } else if (status == 2) {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    (myLocale.languageCode == 'ar') ? 0.0 : 5.0),
                topLeft: Radius.circular(
                    (myLocale.languageCode == 'ar') ? 5.0 : 0.0)),
          ),
          child: Text(
            AppLocalizations.of(context)
                .translate('myOrderPage', 'shippedString'),
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    (myLocale.languageCode == 'ar') ? 0.0 : 5.0),
                topLeft: Radius.circular(
                    (myLocale.languageCode == 'ar') ? 5.0 : 0.0)),
          ),
          child: Text(
            AppLocalizations.of(context)
                .translate('myOrderPage', 'deliveredString'),
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)
              .translate('myOrderPage', 'myOrdersAppBarTitleString'),
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
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          itemCount: cartItemList.length,
          itemBuilder: (context, index) {
            final item = cartItemList[index];
            return Container(
              child: Card(
                  elevation: 3.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        right: (myLocale.languageCode == 'ar') ? null : 0,
                        left: (myLocale.languageCode == 'ar') ? 0 : null,
                        child: _checkStatus(item['status']),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      height: 120.0,
                                      padding: EdgeInsets.only(left: 10.0),
                                      alignment: Alignment.center,
                                      child: Image(
                                        image: AssetImage(item['image']),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  width: (width - 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${item['title']}',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .color,
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
                                            AppLocalizations.of(context)
                                                .translate('myOrderPage',
                                                    'priceString'),
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
                                              color: Colors.blue,
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
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
