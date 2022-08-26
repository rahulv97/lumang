import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_store/pages/product_list_view/product_list_view.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  Widget build(BuildContext context) {

    return Container(
      // height: 305.0,
      padding: EdgeInsets.only(bottom: 0.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            height: 150.0,
            enlargeCenterPage: true,
            items: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: AssetImage("assets/home_slider/home_slider_1.png"),
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: AssetImage("assets/home_slider/home_slider_2.png"),
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListView()));
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: AssetImage("assets/home_slider/home_slider_3.png"),
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
              ),
            ],
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayInterval: const Duration(seconds: 6),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ],
      ),
    );
  }
}