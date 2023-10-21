import 'package:advanced_mobileapp_development/presentation/Home/tutor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                child: Column(children: [
          UpcomingLesson(),
          SearchTutor(),
          Divider(
            // Add a horizontal line
            color: Colors.grey, // Line color
            height: 10, // Line height
            thickness: 0.5, // Line thickness
            indent: 20, // Line indent on the left
            endIndent: 10, // Line indent on the right
          ),


         ListTutors()
        ]))));
  }
}

class UpcomingLesson extends StatelessWidget {
  const UpcomingLesson({super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromARGB(255, 12, 61, 223);

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.only(top: 40, bottom: 30),
      child: Column(
        children: [
          Text(
            "Upcoming lesson",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Thu, 26 Oct 23",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "03:30 - 03:55",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      "(start in 100:02:43)",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.yellow),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Đặt góc bo tròn
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.slow_motion_video,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Enter lesson room",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 14),
                        )
                      ],
                    )),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Total lesson time is 507 hours 55 minutes",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTutor extends StatefulWidget {
  const SearchTutor({super.key});

  @override
  State<SearchTutor> createState() => _SearchTutorState();
}

List<Widget> generateWidgets(List<String> list) {
  List<Widget> widgets = [];
  Color backgroundColor = Color.fromARGB(255, 232, 232, 232);

  for (int i = 0; i < list.length; i++) {
    widgets.add(TextButton(
        onPressed: () {},
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(40, 30)), // Thay đổi width và height tùy ý
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              horizontal: 10, vertical: 5)), // Điều chỉnh lề cho TextButton
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Đặt góc bo tròn
            ),
          ),
        ),
        child: Text(
          list[i],
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ))); // Thêm widget Text vào danh sách
  }

  return widgets;
}

class _SearchTutorState extends State<SearchTutor> {
  DateTime selectDate = DateTime.now();
  TextEditingController _textEditingDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> listFilters = [
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
    List<Widget> generatedWidgets = generateWidgets(listFilters);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      margin: EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find a tutor",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 37,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Màu của biên
                      width: 1.0, // Độ rộng của biên
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    //onChanged: (value)=>_runFilter(value),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: -15, left: 5, right: 2),
                        border: InputBorder.none,
                        hintText: "Enter tutor name...",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400)),
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 37,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Màu của biên
                      width: 1.0, // Độ rộng của biên
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    //onChanged: (value)=>_runFilter(value),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: -15, left: 5, right: 2),
                        border: InputBorder.none,
                        hintText: "Select tutor nation",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400)),
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Select available tutoring time:",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 37,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Màu của biên
                width: 1.0, // Độ rộng của biên
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: _textEditingDate,
              onTap: () async {
                final DateTime? datetime = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(3000));
                if (datetime != null) {
                  setState(() {
                    _textEditingDate.text =
                        "${datetime.year}-${datetime.month}-${datetime.day}";
                    selectDate = datetime;
                  });
                }
              },
              //onChanged: (value)=>_runFilter(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: -2, left: 13, right: 2),
                  border: InputBorder.none,
                  hintText: "Select a day",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.black54,
                    size: 20,
                  )),
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  height: 37,
                  width: 150,
                  padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Màu của biên
                      width: 1.0, // Độ rộng của biên
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    //onChanged: (value)=>_runFilter(value),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -2, left: 13, right: 0),
                      border: InputBorder.none,
                      hintText: "Start time",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                ),
                Container(
                  height: 37,
                  width: 150,
                  padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Màu của biên
                      width: 1.0, // Độ rộng của biên
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    //onChanged: (value)=>_runFilter(value),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(top: -2, left: 13, right: 0),
                      border: InputBorder.none,
                      hintText: "End time",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 0),
            child: Wrap(
              spacing: 5,
              children: generatedWidgets,
            ),
          ),
          TextButton(
              onPressed: () {},
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.blueAccent, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                    Size(40, 30)), // Thay đổi width và height tùy ý
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5)), // Điều chỉnh lề cho TextButton
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Đặt góc bo tròn
                  ),
                ),
              ),
              child: Text(
                "Reset Filters",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueAccent),
              )),
        ],
      ),
    );
  }
}

class ListTutors extends StatelessWidget {
  const ListTutors({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended Tutors",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
            textAlign: TextAlign.left,
          ),
          ListView(
          physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Tutor(), Tutor()

      ],
    ),

        ],
      ),
    );
  }
}
