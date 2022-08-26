import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';

// My Own Imports
import 'package:my_store/pages/product_list_view/get_products.dart';
import 'package:my_store/pages/search.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)
                  .translate('productListViewPage', 'productString'),
              style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                letterSpacing: 1.7,
              ),
            ),
            Text(
              '37024 ${AppLocalizations.of(context).translate('productListViewPage', 'itemsString')}',
              style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                letterSpacing: 1.5,
                color: Colors.grey,
              ),
            )
          ],
        ),
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
                    builder: (context) => Search()),
              );
            },
          ),
        ],
      ),
      body: GetProducts(),
    );
  }
}
