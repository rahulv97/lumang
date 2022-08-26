import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_store/functions/localizations.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int notification = 2;

  final notificationList = [
    {
      'title': 'Biggest Offers on Men\'s Fashion!',
      'description':
          'Bestselling Men\'s Fashion Products at Lowest Prices. Avail 10% Instant Discount* on HDFC Cards. Only till June 5th!'
    },
    {
      'title': 'Biggest Sale Of The Year!',
      'description':
          'Biggest Sale of the year started now only on MyCart. Browse product and start shopping now. Hurry!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.7;

    return Scaffold(
      
      body: (notification == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.bellSlash,
                    color: Colors.grey,
                    size: 60.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    AppLocalizations.of(context)
                        .translate('notification', 'noNotificationsString'),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: notificationList.length,
              itemBuilder: (context, index) {
                final item = notificationList[index];
                return Dismissible(
                  key: Key('$item'),
                  onDismissed: (direction) {
                    setState(() {
                      notificationList.removeAt(index);
                      notification--;
                    });

                    // Then show a snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item['title']} dismissed")));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.red),
                  child: Container(
                    child: Card(
                      elevation: 2.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                FontAwesomeIcons.bell,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              radius: 40.0,
                            ),
                          ),
                          Container(
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 4.0,
                                      right: 8.0,
                                      left: 8.0),
                                  child: Text(
                                    '${item['title']}',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Jost',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.7,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .color,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0,
                                      right: 8.0,
                                      left: 8.0,
                                      bottom: 8.0),
                                  child: Text(
                                    '${item['description']}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.6,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
