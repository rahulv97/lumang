import 'dart:io';

import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/functions/localizations.dart';

// My Own Imports
import 'package:my_store/pages/home/home_main.dart';
import 'package:my_store/pages/my_account/my_account.dart';
import 'package:my_store/pages/my_cart.dart';
import 'package:my_store/pages/notification.dart';
import 'package:my_store/pages/search.dart';
import 'package:my_store/pages/wishlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/logo.png",
              height: 30,
            )),
        titleSpacing: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              }),
          IconButton(
            icon: Badge(
              badgeContent: Text(
                '2',
                style: TextStyle(color: Colors.white),
              ),
              badgeColor: Theme.of(context).primaryColorLight,
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCart()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        hasNotch: false,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.home,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text(
                AppLocalizations.of(context).translate('homePage', 'home'),
                style: TextStyle(fontSize: 13.0),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.favorite_border,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              activeIcon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              title: Text(
                AppLocalizations.of(context).translate('homePage', 'wishList'),
                style: TextStyle(
                    fontSize: (myLocale.languageCode == 'es') ? 11.5 : 13.0),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              activeIcon: Icon(
                Icons.notifications_none,
                color: Colors.red,
              ),
              title: Text(
                "Notification",
                style: TextStyle(fontSize: 13.0),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                FontAwesomeIcons.user,
                color: Theme.of(context).textTheme.headline6.color,
              ),
              activeIcon: Icon(
                FontAwesomeIcons.user,
                color: Colors.red,
                size: 17.0,
              ),
              title: Text(
                AppLocalizations.of(context).translate('homePage', 'account'),
                style: TextStyle(fontSize: 13.0),
              ))
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? HomeMain()
            : (currentIndex == 1)
                ? WishList()
                : (currentIndex == 2)
                    ? Notifications()
                    : MyAccount(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)
            .translate('homePage', 'exitToastString'),
        backgroundColor: Theme.of(context).textTheme.headline6.color,
        textColor: Theme.of(context).appBarTheme.backgroundColor,
      );
      return Future.value(false);
    } else {
      return true;
    }
  }
}
