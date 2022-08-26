import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/Category/category.dart';

class HomeCategoryMenu extends StatefulWidget {
  @override
  _HomeCategoryMenuState createState() => _HomeCategoryMenuState();
}

class _HomeCategoryMenuState extends State<HomeCategoryMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          alignment: Alignment.center,
          color: Theme.of(context).appBarTheme.backgroundColor,
          width: width,
          child: GridView.count(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            crossAxisCount: 3,
            childAspectRatio: ((width) / 200),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: "Shirt",
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/shirt.jpg",
                      height: 22,
                      width: 22,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Shirt",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: "T-Shirt",
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/t_shirt.png",
                      height: 22,
                      width: 22,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "T-Shirt",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: "Kids",
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.baby,
                      size: 22.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Kids",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: "Kurta",
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/kurta.png",
                      height: 22,
                      width: 22,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Kurta",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: "Jewellery",
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/jewelry_ic.png",
                      height: 22,
                      width: 22,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Jewellery",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPage(
                        categoryName: "Toys",
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.toys,
                      size: 22.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Toys",
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        letterSpacing: 1.5,
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
