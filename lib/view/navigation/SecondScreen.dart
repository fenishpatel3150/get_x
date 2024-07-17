

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: ()
          {
            Get.back(
              canPop: true
            );
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                child: Text('Second Page',style: TextStyle(fontSize: 35,color: Colors.white),)),
          )

        ],
      ),
    );
  }
}
