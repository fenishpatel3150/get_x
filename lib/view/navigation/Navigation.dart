import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_x/view/Home/HomeScreen.dart';
import 'package:get_x/view/navigation/SecondScreen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(SecondScreen());
        },
        child: Icon(
          Icons.navigate_next_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                child: Text(
              'First Page',
              style: TextStyle(fontSize: 35),
            )),
          )
        ],
      ),
    );
  }
}

PageRouteBuilder navigation() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animatable<Offset> animatable = Tween(begin: Offset(0.0, 1.0), end: Offset.zero).chain(CurveTween(curve: Curves.ease));
      Animation<Offset> offsetanimation = animation.drive(animatable);
      return AnimatedBuilder(
        animation: offsetanimation,
        builder: (context, child) {
          return Transform.translate(
            offset: offsetanimation.value,
            child: child,
          );
        },
        child: child,
      );
    },
  );
}
