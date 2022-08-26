import 'package:flutter/material.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/pages/product_list_view/product_list_view.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)
                .translate('searchPage', 'searchBrandString'),
            hintStyle: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListView()),
              );
            },
            child: Image.asset('assets/search-image.png'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('searchPage', 'popularString'),
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.7,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Container(
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(width: 0.3, color: Colors.grey),
                      image: DecorationImage(
                        image: AssetImage("assets/category/bags.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'BAGS',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                  ),
                  subtitle: Text(
                    'Stylish Bag',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Container(
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(width: 0.3, color: Colors.grey),
                      image: DecorationImage(
                        image: AssetImage("assets/category/camera.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'CAMERA',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                  ),
                  subtitle: Text(
                    'Awesome Camera',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Container(
                    height: 56.0,
                    width: 56.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.0),
                      border: Border.all(width: 0.3, color: Colors.grey),
                      image: DecorationImage(
                        image: AssetImage("assets/category/speakers.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text(
                    'SPEAKERS',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      letterSpacing: 0.7,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.headline6.color,
                    ),
                  ),
                  subtitle: Text(
                    'Good Quality Speakers',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListView()),
                    );
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
