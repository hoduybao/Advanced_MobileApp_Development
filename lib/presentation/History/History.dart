import 'package:advanced_mobileapp_development/presentation/Schedule/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
          const Size.fromHeight(60.0), // Define the height of the AppBar
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.2), // Color and opacity of the shadow
                  spreadRadius: 5, // Spread radius of the shadow
                  blurRadius: 7, // Blur radius of the shadow
                  offset: const Offset(0, 3), // Offset of the shadow
                ),
              ],
            ),
            child: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  // Status bar color
                  statusBarColor: Colors.black,
                  // Status bar brightness (optional)
                  statusBarIconBrightness:
                  Brightness.light, // For Android (dark icons)
                ),
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          size: 45,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "LetTutor",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ],
                )

              // Replace 'assets/icon.png' with your image path

            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    'images/history.svg', // Replace with the path to your SVG file
                     // Adjust the height as needed
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "History",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.grey, // Color of the left border
                            width: 2.5, // Width of the left border
                          ),
                        )),
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The following is a list of lessons you have attended",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                              "You can review the details of the lessons you have attended",
                              style: TextStyle(fontSize: 16)),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Session(typeSession:"History",time_or_number: "6 hours ago",),
                      Session(typeSession:"History",time_or_number: "6 hours ago",),
                    ],
                  ),

                ]),
          ),
        ));
  }
}


