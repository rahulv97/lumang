import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_store/functions/localizations.dart';

// My Own Import
import 'package:my_store/pages/home/home.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int wishListItem = 2;

  final wishListItemList = [
    {
      'title': 'Ladies Bag',
      'image': 'assets/products/product_7.jpg',
      'price': 77
    },
    {
      'title': 'Sony Camera',
      'image': 'assets/products/product_8.jpg',
      'price': 68
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return (wishListItem == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .translate('wishlistPage', 'wishListEmptyString'),
                  style: TextStyle(
                    fontFamily: 'Jost',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                    color: Theme.of(context).textTheme.headline6.color,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: width - 20.0,
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('wishlistPage', 'saveFavouritePieceString'),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  'assets/empty_wishlist.png',
                  height: 120.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 15.0, left: 15.0),
                      child: Text(
                        AppLocalizations.of(context).translate(
                            'wishlistPage', 'continueShoppingString'),
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Jost',
                          fontSize: 16.0,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: wishListItemList.length,
              itemBuilder: (context, index) {
                final item = wishListItemList[index];
                return Container(
                  alignment: Alignment.center,
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    secondaryActions: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 5.0,
                          bottom: 5.0,
                        ),
                        child: IconSlideAction(
                          caption: AppLocalizations.of(context)
                              .translate('wishlistPage', 'deleteString'),
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              wishListItemList.removeAt(index);
                              wishListItem = wishListItem - 1;
                            });

                            // Then show a snackbar.
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              AppLocalizations.of(context)
                                  .translate('wishlistPage', 'itemRemoved'),
                            )));
                          },
                        ),
                      ),
                    ],
                    child: Container(
                      height: 150,
                      width: (width - 10.0),
                      child: Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 120.0,
                                        height: 125.0,
                                        child: Image(
                                          image: AssetImage(item['image']),
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    // width: (width - 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${item['title']}',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .color,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Price:',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              '\₹${item['price']}',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    .color,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
