import 'package:flutter/material.dart';
import 'package:my_store/pages/Category/best_for_you.dart';
import 'package:my_store/pages/Category/item_discount.dart';
import 'package:my_store/pages/Category/item_popular.dart';
import 'package:my_store/pages/Category/new_item.dart';
import 'package:my_store/pages/Category/sub_category.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;

  CategoryPage({Key key, @required this.categoryName}) : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    String categoryName = widget.categoryName;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            fontFamily: 'Jost',
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            letterSpacing: 1.7,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          // Best for You Start
          BestForYou(),
          // Best for You End

          SizedBox(
            height: 10.0,
          ),

          // Sub Category Start
          SubCategory(),
          // Sub Category End

          SizedBox(
            height: 10.0,
          ),

          // Item Discount Start
          ItemDiscount(),
          // Item Discount End

          SizedBox(height: 10.0),

          // Item Popular Start
          ItemPopular(),
          // Item Popular End

          SizedBox(height: 10.0),

          // New Item Start
          NewItem(),
          // New Item End
        ],
      ),
    );
  }
}
