import 'package:flutter/material.dart';

class TextStatus extends StatelessWidget {
  final String? BigText;
  final String? SmallText;
  const TextStatus({super.key, this.BigText, this.SmallText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: TextField(
              textAlign: TextAlign.center,
              onTap: () {
                Colors.white;
              },
              readOnly: true,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: BigText,
                hintStyle: TextStyle(
                    fontSize: 25, color: Colors.black, fontFamily: 'Ubuntu'),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
        // child: TexT(
        //   BigText!,
        //   style: TextStyle(
        //       fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        // ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Text(
          SmallText!,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontFamily: 'Ubuntu'),
        ),
      ],
    );
  }
}
