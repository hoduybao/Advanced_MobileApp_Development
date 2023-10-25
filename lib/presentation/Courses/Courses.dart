import 'package:advanced_mobileapp_development/presentation/Courses/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'content.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

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
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchCourse(),
              SizedBox(
                height: 15,
              ),
              Text(
                  "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields."),
              Filter(),
              Content()
            ],
          ),
        )));
  }
}

class SearchCourse extends StatefulWidget {
  const SearchCourse({super.key});

  @override
  State<SearchCourse> createState() => _SearchCourseState();
}

class _SearchCourseState extends State<SearchCourse> {
  TextEditingController _textEditingDate = TextEditingController();
  bool isEmpty = true;

  void checkTextEmpty(String value) {
    setState(() {
      isEmpty = value.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'images/ScreenCourse.svg',
          width: 100,
          height: 100, // Replace with the path to your SVG file
          // Adjust the height as needed
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover Courses",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: Container(
                        height: 35,
                        padding: EdgeInsets.only(left: 10, right: 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Màu của biên
                            width: 1.0, // Độ rộng của biên
                          ),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: _textEditingDate,
                          onChanged: (value) => {checkTextEmpty(value)},
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: -4, left: 0),
                              border: InputBorder.none,
                              hintText: "Course",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                              suffixIcon: Visibility(
                                visible: !isEmpty,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.highlight_remove_outlined,
                                    color: Colors.black54,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    _textEditingDate.text = "";
                                  },
                                ),
                              )),
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Màu của biên
                            width: 1.0, // Độ rộng của biên
                          ),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search_rounded,
                              size: 25,
                              color: Colors.grey,
                            )),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}



