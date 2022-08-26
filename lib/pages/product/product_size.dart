import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';

class ProductSize extends StatefulWidget {
  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  Color activeColor = Colors.red;
  Color nonActiveColor = Colors.grey;
  bool xsSize = false, sSize = false, mSize = false, lSize = false;
  bool blackColor = false, redColor = false, blueColor = false;
  Color activeColorBorder = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: EdgeInsets.all(10.0),
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('productPage', 'sizeString'),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jost',
              letterSpacing: 0.7,
              color: Theme.of(context).textTheme.headline6.color,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Tip: ${AppLocalizations.of(context).translate('productPage', 'tipString')}',
            style: TextStyle(
              fontSize: 12.0,
              color: Theme.of(context).textTheme.headline6.color,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!xsSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!xsSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'XS',
                    style: TextStyle(
                        color: (!xsSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!xsSize) {
                      xsSize = true;
                      sSize = false;
                      mSize = false;
                      lSize = false;
                    } else {
                      xsSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!sSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!sSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'S',
                    style: TextStyle(
                        color: (!sSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!sSize) {
                      sSize = true;
                      xsSize = false;
                      mSize = false;
                      lSize = false;
                    } else {
                      sSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!mSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!mSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'M',
                    style: TextStyle(
                        color: (!mSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!mSize) {
                      mSize = true;
                      xsSize = false;
                      sSize = false;
                      lSize = false;
                    } else {
                      mSize = false;
                    }
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (!lSize) ? nonActiveColor : activeColor),
                    borderRadius: BorderRadius.circular(10.0),
                    color: (!lSize) ? Colors.white : activeColor,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'L',
                    style: TextStyle(
                        color: (!lSize) ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (!lSize) {
                      lSize = true;
                      xsSize = false;
                      sSize = false;
                      mSize = false;
                    } else {
                      lSize = false;
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Divider(height: 1.0),
          SizedBox(
            height: 8.0,
          ),
          Text(
            AppLocalizations.of(context)
                .translate('productPage', 'colorString'),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jost',
              letterSpacing: 0.7,
              color: Theme.of(context).textTheme.headline6.color,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              (!blackColor) ? Colors.grey : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.black,
                    ),
                    child: (!blackColor)
                        ? Container()
                        : Container(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!blackColor) {
                        blackColor = true;
                        redColor = false;
                        blueColor = false;
                      } else {
                        blackColor = false;
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!redColor) ? Colors.grey : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.red,
                    ),
                    child: (!redColor)
                        ? Container()
                        : Container(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!redColor) {
                        redColor = true;
                        blackColor = false;
                        blueColor = false;
                      } else {
                        redColor = false;
                      }
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: (!blueColor) ? Colors.grey : activeColorBorder,
                          width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.blue,
                    ),
                    child: (!blueColor)
                        ? Container()
                        : Container(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      if (!blueColor) {
                        blueColor = true;
                        redColor = false;
                        blackColor = false;
                      } else {
                        blueColor = false;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
