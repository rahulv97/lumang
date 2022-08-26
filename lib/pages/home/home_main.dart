import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/home/home_component/category_grid.dart';

// My Own Import
import 'package:my_store/pages/home/home_component/category_slider.dart';
import 'package:my_store/pages/home/home_component/deal_of_the_day.dart';
import 'package:my_store/pages/home/home_component/new_main_slider.dart';
import 'package:my_store/pages/home/home_component/menu.dart';
import 'package:my_store/pages/home/home_component/recommended_products.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        // Category Slider Start
        //CategorySlider(),
        // Category Slider End

        // Main Slider Start
        // MainSlider(),
        NewMainSlider(),
        // Main Slider End
        SizedBox(
          height: 5.0,
        ),
        Divider(),
        SizedBox(
          height: 5.0,
        ),

        // Menu Start
        Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          padding: EdgeInsets.all(0.0),
          child: Text(
            "",
            style: TextStyle(
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              letterSpacing: 1.5,
              color: Theme.of(context).textTheme.headline6.color,
            ),
          ),
        ),

        HomeCategoryMenu(),
        // Menu End
        SizedBox(
          height: 5.0,
        ),
        Divider(),
        SizedBox(
          height: 5.0,
        ),
        // Featured Item Start
        DealOfTheDay(),
        // Featured Item End

        SizedBox(
          height: 5.0,
        ),
        Divider(),
        SizedBox(
          height: 5.0,
        ),

        // Category Grid Start
        CategoryGrid(),
        // Category Grid End

        SizedBox(
          height: 5.0,
        ),
        Divider(),
        SizedBox(
          height: 5.0,
        ),

        // Recommended Products Start
        RecommendedProducts(),
        // Recommended Products Ends
      ],
    );
  }
}
