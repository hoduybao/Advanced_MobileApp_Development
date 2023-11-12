import 'package:advanced_mobileapp_development/presentation/Home/tutor.dart';
import 'package:flutter/cupertino.dart';

import '../../model/tutor-dto.dart';

class ListTutors extends StatefulWidget {

  const ListTutors(this.tutors, {super.key});
  final List<TutorDTO> tutors;

  @override
  State<ListTutors> createState() => _ListTutorsState();
}

class _ListTutorsState extends State<ListTutors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      margin: EdgeInsets.only(top: 20,bottom: 20),
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
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.tutors.length,
            itemBuilder: (context, index) {
              return Tutor(widget.tutors[index]);
                // Add more customization here if needed
            },
          ),

        ],
      ),
    );
  }
}
