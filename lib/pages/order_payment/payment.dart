import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/home/home.dart';

// My Own Imports

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedRadioPayment;

  @override
  void initState() {
    super.initState();
    selectedRadioPayment = 0;
  }

  setSelectedRadioPayment(int val) {
    setState(() {
      selectedRadioPayment = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)
              .translate('paymentPage', 'appBarTitleString'),
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
                      .translate('paymentPage', 'choosePaymentMethodString'),
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Alatsi',
                      height: 1.6),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: width - 40.0,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: RadioListTile(
                    value: 1,
                    groupValue: selectedRadioPayment,
                    title: Text(
                      AppLocalizations.of(context)
                          .translate('paymentPage', 'creditDebitCardString'),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                    onChanged: (val) {
                      setSelectedRadioPayment(val);
                    },
                    activeColor: Theme.of(context).primaryColor,
                    secondary: Image(
                      image: AssetImage(
                        'assets/payment_icon/card.png',
                      ),
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Container(
                  width: width - 40.0,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: RadioListTile(
                    value: 2,
                    groupValue: selectedRadioPayment,
                    title: Text(
                      AppLocalizations.of(context)
                          .translate('paymentPage', 'cashOnDeliveryString'),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                    onChanged: (val) {
                      setSelectedRadioPayment(val);
                    },
                    activeColor: Theme.of(context).primaryColor,
                    secondary: Image(
                      image: AssetImage(
                        'assets/payment_icon/cash_on_delivery.png',
                      ),
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Container(
                  width: width - 40.0,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: RadioListTile(
                    value: 3,
                    groupValue: selectedRadioPayment,
                    title: Text(
                      "PayPal",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                    onChanged: (val) {
                      setSelectedRadioPayment(val);
                    },
                    activeColor: Theme.of(context).primaryColor,
                    secondary: Image(
                      image: AssetImage(
                        'assets/payment_icon/paypal.png',
                      ),
                      height: 40.0,
                      width: 40.0,
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
                Container(
                  width: width - 40.0,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: RadioListTile(
                    value: 4,
                    groupValue: selectedRadioPayment,
                    title: Text(
                      "Google Wallet",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                    onChanged: (val) {
                      setSelectedRadioPayment(val);
                    },
                    activeColor: Theme.of(context).primaryColor,
                    secondary: Image(
                      image: AssetImage(
                        'assets/payment_icon/google_wallet.png',
                      ),
                      height: 40.0,
                      width: 40.0,
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
                      _showDialog();
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
                            .translate('paymentPage', 'payString'),
                        style: TextStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          fontFamily: 'Jost',
                          fontSize: 17.0,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.bold,
                        ),
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

  // user defined function for Logout Dialogue
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 5.0,
          // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: Container(
            height: 250.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 5.0),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 50.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  AppLocalizations.of(context)
                      .translate('paymentPage', 'congratulationsString'),
                  style: TextStyle(
                    fontFamily: 'Jost',
                    letterSpacing: 0.7,
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline6.color,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  AppLocalizations.of(context)
                      .translate('paymentPage', 'paymentReceived'),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    });
  }
}
