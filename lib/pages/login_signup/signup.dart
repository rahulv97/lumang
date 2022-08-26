import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_store/functions/localizations.dart';
import 'package:my_store/functions/showToast.dart';
import 'package:my_store/pages/home/home.dart';
import 'package:my_store/pages/login_signup/forgot_password.dart';
import 'package:my_store/pages/login_signup/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var style_val;

  var front_img_txt = "Choose Image";
  var back_img_txt = "Choose Image";
  var right_img_txt = "Choose Image";
  var left_img_txt = "Choose Image";
  var ud_img_txt = "Choose Image";

  File uploadimage; //variable for choosed file

  Future<void> chooseImage(var img_type) async {
    var choosedimage =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      try {
        print("Choosed File: " + choosedimage.path);
        uploadimage = File(choosedimage.path);
        //front_img_txt = "Selected";
        if(img_type=="front"){
front_img_txt = "Selected";
        }
        if(img_type=="back"){
          back_img_txt = "Selected";
        }
        if(img_type=="left"){
          left_img_txt = "Selected";
        }
        if(img_type=="right"){
          right_img_txt = "Selected";
        }
        if(img_type=="udyam"){
          ud_img_txt = "Selected";
        }
      } catch (e) {
        print(e.toString());
        
        if(img_type=="front"){
front_img_txt = "Choose Image";
        }
        if(img_type=="back"){
          back_img_txt = "Choose Image";
        }
        if(img_type=="left"){
          left_img_txt = "Choose Image";
        }
        if(img_type=="right"){
          right_img_txt= "Choose Image";
        }
        if(img_type=="udyam"){
          ud_img_txt = "Choose Image";
        }
      }
    });
  }

  var mob_number;

  TextEditingController shopname_controller = TextEditingController();
  TextEditingController shopowner_controller = TextEditingController();
  TextEditingController pan_controller = TextEditingController();
  TextEditingController gst_controller = TextEditingController();
  TextEditingController pin_controller = TextEditingController();
  TextEditingController udyam_controller = TextEditingController();

  Future<http.Response> postRequest(var context) async {
    var url = 'https://demo22.appman.in/api/buyerregister/';

    print(shopname_controller.text);
    Map data = {
      "shopownername": shopowner_controller.text,
      "shopname": shopname_controller.text,
      "businesspancardno": pan_controller.text,
      "Gstcertificate": gst_controller.text,
      "typeofbusiness": style_val,
      "Phoneno": mob_number,
      "pincode": pin_controller.text,
      "udyamregistrationcertificate": udyam_controller.text,
      "frontsidephoto": "",
      "backsidephoto": "",
      "leftsidephoto": "",
      "rightsidephoto": ""
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('logstatus', "loggedin");
      prefs.setString("regphone", mob_number);
      Navigator.push(context,
          PageTransition(type: PageTransitionType.rightToLeft, child: Home()));
    }
    return response;
  }

  Future<void> uploadImage() async {
    //show your own loading or progressing code here

    String uploadurl = "https://demo22.appman.in/image/imageupload";
    FormData formData = new FormData.fromMap({
      "frontsidephoto": await MultipartFile.fromFile(uploadimage.path,
          filename: uploadimage.path.split('/').last)
    });
    var response = await Dio().post(uploadurl, data: formData,
        onSendProgress: (int begin, int end) {
      var initial = begin;
      var done = end;
      print('$initial $end');
    });
    print(response.data['path']);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    setState(() {
      mob_number = arguments['mob'];
    });
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 35.0),
                Image.asset(
                  'assets/round_logo.png',
                  height: 50.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: width - 40.0,
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, right: 10.0, left: 10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.5,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Complete your KYC",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jost',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          controller: shopname_controller,
                          decoration: InputDecoration(
                            hintText: "Shop Name",
                            prefixIcon: Icon(Icons.shopping_bag_rounded),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          controller: shopowner_controller,
                          decoration: InputDecoration(
                            hintText: "Shop Owner Name",
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          controller: gst_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "GSTN Number",
                            prefixIcon: Icon(Icons.numbers_rounded),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          controller: pan_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Business PAN Number",
                            prefixIcon: Icon(Icons.numbers_rounded),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          controller: udyam_controller,
                          //keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Udyam Registeration Certificate",
                            prefixIcon: Icon(Icons.card_membership_rounded),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          controller: pin_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Postal Code",
                            prefixIcon: Icon(Icons.pin),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: DropdownButton(
                          itemHeight: 50,
                          isExpanded: true,
                          underline: Container(height: 0),
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          iconSize: 25,
                          elevation: 16,
                          value: style_val,
                          items: <String>[
                            'Type 1',
                            'Type 2',
                            'Type 3',
                            'Type 4',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              style_val = value;
                            });
                          },
                          hint: Text("Business Type"),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Reference Code",
                            prefixIcon: Icon(Icons.code),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Front Side"),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () => chooseImage("front"),
                                child: Container(
                                  height: 35.0,
                                  //width: 190.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Text(
                                            front_img_txt,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Jost',
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Back Side"),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () => chooseImage("back"),
                                child: Container(
                                  height: 35.0,
                                  //width: 190.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Text(
                                            back_img_txt,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Jost',
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Left Side"),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () => chooseImage("left"),
                                child: Container(
                                  height: 35.0,
                                  //width: 190.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Text(
                                            left_img_txt,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Jost',
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Right Side"),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () => chooseImage("right"),
                                child: Container(
                                  height: 35.0,
                                  //width: 190.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Text(
                                            right_img_txt,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Jost',
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Udyam Certificate"),
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () => chooseImage("udyam"),
                                child: Container(
                                  height: 35.0,
                                  //width: 190.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Text(
                                            ud_img_txt,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Jost',
                                              fontSize: 16.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(""),
                              Container(
                                height: 0.0,
                                //width: 190.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.redAccent,
                                  color: Colors.red,
                                  elevation: 7.0,
                                  child: GestureDetector(
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text(
                                          "Choose Image",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Jost',
                                            fontSize: 16.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     PageTransition(
                          //         type: PageTransitionType.rightToLeft,
                          //         child: Home()));

                          if (shopname_controller.text.isEmpty) {
                            ShowToast().showToast("Shop Name is Required");
                          } else if (shopowner_controller.text.isEmpty) {
                            ShowToast()
                                .showToast("Shop Owner Name is Required");
                          } else if (gst_controller.text.isEmpty) {
                            ShowToast().showToast("GST Number is Required");
                          } else if (pan_controller.text.isEmpty) {
                            ShowToast().showToast("Business PAN is Required");
                          } else if (udyam_controller.text.isEmpty) {
                            ShowToast().showToast(
                                "Udyam Registeration Number is Required");
                          } else if (pin_controller.text.isEmpty) {
                            ShowToast().showToast("Postal Code is Required");
                          } else {
                            postRequest(context);
                          }
                        },
                        child: Container(
                          height: 45.0,
                          width: 190.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.redAccent,
                            color: Colors.red,
                            elevation: 7.0,
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Jost',
                                    fontSize: 16.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 15.0,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         PageTransition(
                      //             type: PageTransitionType.rightToLeft,
                      //             child: LoginPage()));
                      //   },
                      //   child: Text(
                      //     AppLocalizations.of(context)
                      //         .translate('loginPage', 'loginString'),
                      //     style: TextStyle(
                      //       color: Theme.of(context).textTheme.headline6.color,
                      //       fontFamily: 'Jost',
                      //       fontSize: 17.0,
                      //       letterSpacing: 0.7,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
