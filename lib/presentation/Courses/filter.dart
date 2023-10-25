
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String? valueLevel;
  String? valueCategory;
  String? valueSort;

  List<String> category = [
    "All",
    "English for kids",
    "English for Business",
    "Conversational",
    "STARTERS",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IELTS",
    "TOEFL",
    "TOEIC"
  ];
  List<String> sort = ["Level decreasing", 'Level ascending'];
  List<String> level = [
    "Any level",
    "Beginer",
    "Upper-Beginer",
    "Pre-Intermedicate",
    "Intermedicate",
    "Upper-Intermedicate",
    "Pre-advanced",
    "Advanced",
    "Very advanced"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children:[
              Expanded(
                flex: 1,
                child: Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 10, right: 5),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                  child: DropdownButton(
                      hint: Text(
                        'Select level',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      onChanged: (newValue) {
                        setState(() {
                          valueLevel = newValue;
                        });
                      },
                      items: level.map((valueItem) {
                        return DropdownMenuItem(
                            child: Text(
                              valueItem,
                              style: TextStyle(fontWeight: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: valueItem);
                      }).toList(),
                      value: valueLevel),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                flex: 1,
                child: Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 10, right: 5),
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                  child: DropdownButton(
                      hint: Text(
                        'Select category',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      onChanged: (newValue) {
                        setState(() {
                          valueCategory = newValue;
                        });
                      },
                      items: category.map((valueItem) {
                        return DropdownMenuItem(
                            child: Text(
                              valueItem,
                              style: TextStyle(fontWeight: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: valueItem);
                      }).toList(),
                      value: valueCategory),
                ),
              ),
            ]

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                    margin: EdgeInsets.only(top: 15),
                    width: 160,
                    height: 35,
                    padding: EdgeInsets.only(left: 10, right: 5),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                    child: DropdownButton(
                        hint: Text(
                          'Sort by level',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        onChanged: (newValue) {
                          setState(() {
                            valueSort = newValue;
                          });
                        },
                        items: sort.map((valueItem) {
                          return DropdownMenuItem(
                              child: Text(
                                valueItem,
                                style: TextStyle(fontWeight: FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: valueItem);
                        }).toList(),
                        value: valueSort),
                  ),
            ],
          ),
            ],
      ),
    );
  }
}