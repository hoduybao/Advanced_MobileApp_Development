import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tutor extends StatefulWidget {
  const Tutor({super.key});

  @override
  State<Tutor> createState() => _TutorState();
}

class _TutorState extends State<Tutor> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20,top: 15,right: 20),
          decoration: BoxDecoration(
            color: Colors.white, // Màu nền của container
            borderRadius: BorderRadius.circular(10), // Độ bo tròn góc của container
            boxShadow: [
              BoxShadow(
                color: Colors.grey, // Màu của đổ bóng
                offset: Offset(1, 1), // Độ dịch chuyển đổ bóng theo chiều ngang và chiều dọc
                blurRadius: 2, // Độ mờ của đổ bóng
                spreadRadius: 0, // Độ rộng lan trải của đổ bóng
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 60, // Đặt chiều rộng của container
                height: 60, // Đặt chiều cao của container
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Đặt hình dạng là hình tròn
                  border: Border.all(
                    color: Colors.blue, // Màu của đường viền
                    width: 1, // Độ rộng của đường viền
                  ),
                ),
                child: ClipOval(
                  child: Image.asset('images/welcome_login.png'), // Thay thế bằng hình ảnh của bạn
                ),
              ),
              Text("Keegan",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),)


            ],
          ),
        )
      ],
    );
  }
}
