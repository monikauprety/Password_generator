import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paswordgenerator/Smalltext.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(173, 216, 230, 1),
      body: Container(
        child: Column(
          children: [
            TextStatus(
              BigText: 'Password Generator',
              SmallText: 'Create strong, easy to remember password',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
                  onTap: () {
                    Colors.red;
                  },
                  controller: controller,
                  readOnly: true,
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                      hintText: generatePassword(),
                      // hintStyle: TextStyle(
                      //     fontSize: 18,
                      //     color: Colors.black,
                      //     fontFamily: 'Ubuntu'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 5, color: Colors.red),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: Colors.red,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          final data = ClipboardData(text: controller.text);
                          Clipboard.setData(data);
                          final snackBar = SnackBar(
                            content: Text(
                              'Password Copied',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontFamily: 'Ubuntu'),
                            ),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                        icon: Icon(Icons.copy),
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.1,
          child: ElevatedButton(
            onPressed: () {
              final password = generatePassword();
              controller.text = password;
            },
            child: Text('Generate Password',
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Ubuntu')),
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Background color
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.1,
          child: ElevatedButton(
            onPressed: () {
              final data = ClipboardData(text: controller.text);
              Clipboard.setData(data);
              final snackBar = SnackBar(
                content: Text(
                  'Password Copied',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'Ubuntu'),
                ),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackBar);
            },
            child: Text('Copy Password',
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Ubuntu')),
            style: ElevatedButton.styleFrom(
              primary: Colors.black, // Background color
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Text('Copyright 2023 Alivecoder')
      ],
    );
  }

  String generatePassword() {
    final length = 20;
    final Lowercase = 'abcdefghijklmnopqrstuvwxyz';
    final Uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';
    final specialLetters = '+-/*{}[]()!@#%^&';
    String chars = '';
    chars += '$Lowercase$Uppercase$numbers$specialLetters';
    return List.generate(length, (index) {
      final indexRandom = Random().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }
}
