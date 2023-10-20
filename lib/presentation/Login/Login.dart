import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                )

                // Replace 'assets/icon.png' with your image path

                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15, right: 15, bottom: 0, left: 15),
            child: Column(
              children: [
                Image.asset("images/welcome_login.png"),
                SizedBox(
                  height: 30,
                ),
                Text("Say hello to your English tutors",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Become fluent faster through one on one video chat lessons tailored to your goals.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                FormLogin(),
                Container(
                  margin: EdgeInsets.only(top: 30),
                    child: Text("Or continue with")),
                OrtherLogin()
              ],
            ),
          ),
        ));
  }
}

class OrtherLogin extends StatelessWidget {
  const OrtherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/facebook.png", width: 30, height: 30),
              SizedBox(
                width: 20,
              ),
              Image.asset("images/google.png", width: 30, height: 30),
              SizedBox(
                width: 20,
              ),
              Image.asset("images/smartphone.png", width: 30, height: 30),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25,bottom: 50),
            child: RichText(
              text: TextSpan(
                text: 'Not a member yet? ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: 'Sign up', style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Màu của biên
                width: 1.0, // Độ rộng của biên
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              //onChanged: (value)=>_runFilter(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: -10),
                border: InputBorder.none,
              ),
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
              "Password",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Màu của biên
                width: 1.0, // Độ rộng của biên
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              //onChanged: (value)=>{},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 1),
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
                border: InputBorder.none,
              ),
              obscureText: true,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 5),
            child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Đặt góc bo tròn
                    ),
                  ),
                ),
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
