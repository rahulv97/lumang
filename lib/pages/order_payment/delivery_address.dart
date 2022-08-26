import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/order_payment/payment.dart';
import 'package:page_transition/page_transition.dart';

// My Own Imports

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)
              .translate('deliveryPage', 'appBarTitleString'),
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 18.0,
            letterSpacing: 1.7,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .translate('deliveryPage', 'whereShippedString'),
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alatsi',
                      height: 1.6),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .translate('deliveryPage', 'pinCodeString'),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Container(
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .translate('deliveryPage', 'localityString'),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Container(
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .translate('deliveryPage', 'cityString'),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Container(
                  width: width - 40.0,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .translate('deliveryPage', 'stateString'),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: PaymentPage()));
                    },
                    child: Container(
                      width: width - 40.0,
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('deliveryPage', 'goToPaymentString'),
                        style: TextStyle(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            fontFamily: 'Jost',
                            letterSpacing: 0.7,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
