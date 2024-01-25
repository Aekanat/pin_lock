import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const phone(),
    );
  }
}

class button extends StatelessWidget {
  const button({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class phone extends StatefulWidget {
  const phone({super.key});

  @override
  State<phone> createState() => _phoneState();
}

class _phoneState extends State<phone> {
  var _code = '______';
  int currentInx = 0;

  Widget button({required String num, required String txt}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _code = _code.replaceRange(currentInx, currentInx + 1, num);
            currentInx++;
          });
        },
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  num,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  txt,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 60, 0, 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.shield_outlined,
              color: Colors.black,
              size: 60,
            ),
            Text(
              'PIN LOGIN',
              style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              _code,
              style: GoogleFonts.poppins(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(num: '1', txt: 'one'),
                  button(num: '2', txt: 'two'),
                  button(num: '3', txt: 'three'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(num: '4', txt: 'four'),
                button(num: '5', txt: 'five'),
                button(num: '6', txt: 'six'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(num: '7', txt: 'seven'),
                button(num: '8', txt: 'eight'),
                button(num: '9', txt: 'nine'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentInx = 0;
                      _code = '______';
                    });
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'X',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                ),
                button(num: '0', txt: 'zero'),
                InkWell(
                  onTap: () {
                    setState(() {
                      _code =
                          _code.replaceRange(currentInx - 1, currentInx, '_');
                      currentInx--;
                    });
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.backspace,
                            color: Colors.grey,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
