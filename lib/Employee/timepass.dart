import 'package:flutter/material.dart';




class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Test> {

  // Initial Selected Value

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(40),

              ),
              child: Center(
                child: Text(
                  'Press',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}