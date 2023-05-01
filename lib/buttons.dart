import 'package:flutter/material.dart';
import 'package:paswordgenerator/Smalltext.dart';

class ButtonsStatus extends StatelessWidget {
  const ButtonsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Generate Password",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // child: TextStatus(
        //   SmallText: "Generate Password",
      ),
    );
  }
}
