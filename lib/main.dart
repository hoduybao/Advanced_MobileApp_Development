import 'dart:convert';

import 'package:advanced_mobileapp_development/model/account-dto.dart';
import 'package:advanced_mobileapp_development/model/rate-dto.dart';
import 'package:advanced_mobileapp_development/model/tutor.dart';
import 'package:advanced_mobileapp_development/presentation/Courses/Courses.dart';
import 'package:advanced_mobileapp_development/presentation/History/History.dart';
import 'package:advanced_mobileapp_development/presentation/Home/Home.dart';
import 'package:advanced_mobileapp_development/presentation/Login/Login.dart';
import 'package:advanced_mobileapp_development/presentation/Schedule/Schedule.dart';
import 'package:advanced_mobileapp_development/repository/favorite-repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import 'model/schedule-dto.dart';

void main() {
  runApp(MyApp());
}
typedef LoginCallback = void Function(int _appState);

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Account account = Account(email: "", password: "");
  List<TutorDTO> listTutor=[];
  final favouriteRepository = new FavouriteRepository();
  @override
  void initState() {
    // TODO: implement initState
    loadTutors();
  }
  Future<void> loadTutors() async {
    // Đọc dữ liệu từ file JSON
    String jsonString = await rootBundle.loadString('assets/data/dataTutor.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);

    // Lấy danh sách tutors từ dữ liệu JSON
    List<Map<String, dynamic>> tutorList = [];
    List<Map<String, dynamic>> favoriteList = [];

    if (jsonData['tutors'] != null && jsonData['tutors']['rows'] is List) {
      tutorList = List<Map<String, dynamic>>.from(jsonData['tutors']['rows']);
    }

    // Chuyển đổi thành danh sách các đối tượng Tutor'
      listTutor = tutorList.map((json) => TutorDTO.fromJson(json)).toList();

    if(jsonData['tutors'] != null && jsonData['favoriteTutor'] is List)
      {
        favoriteList = List<Map<String, dynamic>>.from(jsonData['favoriteTutor']);
      }
    List<String> idindex = [];

    for (var tutor in favoriteList) {
      String secondId = tutor['secondId'];
      idindex.add(secondId);
    }

    setState(() {
      favouriteRepository.setListIds(idindex);
    });



  }


  int appState = 0;
  void loginCallback(int _appState) {
    setState(() {
      appState = _appState;
    });
  }

  Widget displayWidget() {
    if (appState == 0) {
      return Login(loginCallback);
    } else  {
      return BottomNavBar(loginCallback);
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => account),
        Provider(create: (context)=>listTutor),
        ChangeNotifierProvider(create: (context) => favouriteRepository)
      ],
      child: MaterialApp(
          title: 'LetTutor',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: Consumer<Account>(
          builder: (context, account, _) {
            return displayWidget();
          })

          ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(this.loginCallback,{super.key});
  final LoginCallback loginCallback;


  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [Home(loginCallback), Courses(loginCallback), Schedule(loginCallback), History(loginCallback)];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_outlined),
          title: ("Home"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.school),
          title: ("Courses"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.calendar_month),
          title: ("Schedule"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.history),
          title: ("History"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
