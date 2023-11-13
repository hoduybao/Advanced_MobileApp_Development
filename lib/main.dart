import 'package:advanced_mobileapp_development/model/account-dto.dart';
import 'package:advanced_mobileapp_development/model/rate-dto.dart';
import 'package:advanced_mobileapp_development/model/tutor-dto.dart';
import 'package:advanced_mobileapp_development/presentation/Courses/Courses.dart';
import 'package:advanced_mobileapp_development/presentation/History/History.dart';
import 'package:advanced_mobileapp_development/presentation/Home/Home.dart';
import 'package:advanced_mobileapp_development/presentation/Login/Login.dart';
import 'package:advanced_mobileapp_development/presentation/Schedule/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

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
  final List<TutorDTO> listTutor=[
    new TutorDTO("1", 'Kenga', "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg", "Tunisia", "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/tn.svg", 5, ["English for Business","Conversational","English for kids","IELTS"], "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.", "assets/video/VideoDeTailTutor.mp4", "BA", "English", "I loved the weather, the scenery and the laid-back lifestyle of the locals.", "I have more than 10 years of teaching english experience", [new Rate("Duy Bao", "images/welcome_login.png", "5 days ago", 5,"good"),new Rate("Duy Bao", "images/welcome_login.png", "6 days ago", 3,"123"),new Rate("Xuan Quang", "images/welcome_login.png", "7 days ago", 1,"so bad")]),
    new TutorDTO("2", 'Joan Gacer', "https://api.app.lettutor.com/avatar/8c4e58c4-e9d1-4353-b64d-41b573c5a3e9avatar1632284832414.jpg", "Taiwan ", "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/tw.svg", 4, ["English for Business","STARTERS","MOVERS","TOEIC"], "I was a customer service sales executive for 3 years before I become an ESL teacher I am trained to deliver excellent service to my clients so I can help you with business English dealing with customers or in sales-related jobs and a lot more, I also love to teach beginner, intermediate and advance I speak slowly and clearly so that the student can easily follow my instructions and pronunciation. In my class, I want environment-friendly fun and engaging I have many activities designed to help your enthusiasm in learning the language. I'm so excited to meet you in one of my classes let us have fun while learning English. See you there.", "assets/video/VideoDeTailTutor.mp4", "Tsinghua University - THU", "English", "I am a fun, talkative person who loves to find out about others cultures and experience.", "Acadsoc - English Language Instruction Chinese based online English teaching platform. I taught EILTS as well as a wide age range of Children and adults of all levels. Sincewin - English Language Instruction Online English lessons for whole kindergarten classes. I taught basic phonics and vocabulary using songs, TPR and puppets", [new Rate("Duy Bao", "images/welcome_login.png", "5 days ago", 5,"good"),new Rate("Duy Bao", "images/welcome_login.png", "6 days ago", 3,"123"),new Rate("Xuan Quang", "images/welcome_login.png", "7 days ago", 1,"so bad")]),
    new TutorDTO("3", 'April Baldo', "https://api.app.lettutor.com/avatar/83802576-70fe-4394-b27a-3d9e8b50f1b7avatar1649512219387.jpg", "Philippines ", "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/ph.svg", 5, ["English for Business","PET","KET","IELTS"], "Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.", "assets/video/VideoDeTailTutor.mp4", "Earth, Vegeta planet", "Japanese", "Fighting", "7 years of English tutor", [new Rate("Duy Bao", "images/welcome_login.png", "5 days ago", 5,"good"),new Rate("Duy Bao", "images/welcome_login.png", "6 days ago", 3,"123"),new Rate("Xuan Quang", "images/welcome_login.png", "7 days ago", 1,"so bad")]),
    new TutorDTO("4", 'Jill Leano', "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg", "US ", "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/us.svg", 3, ["English for Business","English for kids","TOEFL","TOEIC"], "Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like to share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy to focus on my learner's goal.", "assets/video/VideoDeTailTutor.mp4", "Certified at English education", "English", "English, Japansese", "5 years in education", [new Rate("Duy Bao", "images/welcome_login.png", "5 days ago", 5,"good"),new Rate("Duy Bao", "images/welcome_login.png", "6 days ago", 3,"123"),new Rate("Xuan Quang", "images/welcome_login.png", "7 days ago", 1,"so bad")]),
    new TutorDTO("5", 'Ho Duy Bao', "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg", "Vietnam ", "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/vn.svg", 2, ["TOEIC"], "Recusandae dignissimos ut commodi et iste qui eum quos.", "assets/video/VideoDeTailTutor.mp4", "Voluptates labore quia laboriosam porro rerum consequatur minima. Ex dolorem eligendi atque aliquid est esse labore rerum. Quia natus repellat omnis veniam quaerat veniam veniam.", "English", "Non quia nulla dolores quia nobis ipsum. Non aliquid repudiandae voluptatum. Consequuntur officiis animi et et esse dolor quibusdam. Id sunt ut id nemo recusandae tempore corporis molestiae. Doloremque provident tempore.", "Qui deleniti consequuntur alias. Id quo ad vero iste nihil qui aut quia. Unde reiciendis non. Consequatur voluptatibus voluptate velit aut ullam est.", [new Rate("Duy Bao", "images/welcome_login.png", "5 days ago", 5,"good"),new Rate("Duy Bao", "images/welcome_login.png", "6 days ago", 3,"123"),new Rate("Xuan Quang", "images/welcome_login.png", "7 days ago", 1,"so bad")]),

  ];
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
        Provider(create: (context)=>listTutor)
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
