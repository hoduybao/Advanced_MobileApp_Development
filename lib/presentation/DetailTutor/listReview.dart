import 'package:advanced_mobileapp_development/presentation/DetailTutor/review.dart';
import 'package:flutter/cupertino.dart';

class ListReview extends StatelessWidget {
  const ListReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Others review",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
           ListView(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             children: [
               Review(avatar: "images/avatarUser.jpg", username: "Bao Bao", time: "3 days ago", rating: 3, comment: "good"),
               Review(avatar: "images/avatarUser.jpg", username: "Bao Bao", time: "2 days ago", rating: 5, comment: "abcde"),
               Review(avatar: "images/avatarUser.jpg", username: "Bao Bao", time: "3 days ago", rating: 1, comment: "đsfsd"),
               Review(avatar: "images/avatarUser.jpg", username: "Bao Bao", time: "1 days ago", rating: 2, comment: "123")


             ],
           )
         ],
      ),
    );
  }
}
