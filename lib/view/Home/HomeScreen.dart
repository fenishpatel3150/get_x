import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controller/CountController.dart';

class HomeScreen extends StatelessWidget {
  final CountController countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: ()
        {
          countController.incriment();
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Obx(() => Text('${countController.count}',style: TextStyle(fontSize: 35),)),
      ),
    );
  }
}

