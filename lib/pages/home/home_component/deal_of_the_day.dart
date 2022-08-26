import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/product_list_view/product_list_view.dart';

class DealOfTheDay extends StatefulWidget {
  @override
  _DealOfTheDayState createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)
                .translate('homePage', 'dealOfTheDayString'),
            style: TextStyle(
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              letterSpacing: 1.5,
              color: Theme.of(context).textTheme.headline6.color,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 70.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductListView()));
                  },
                  child: Image.asset(
                      'assets/deal_of_the_day/deal_of_the_day_1.png'),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductListView()));
                  },
                  child: Image.asset(
                      'assets/deal_of_the_day/deal_of_the_day_2.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
