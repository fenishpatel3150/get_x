<h2 align = "center"> 1. Count App With GetX </h2>

### Using GetX in a Flutter Counter App

GetX is a powerful and lightweight state management solution for Flutter. Here's a step-by-step description of how to implement a simple counter app using GetX:

#### 1. Add Dependencies
First, add the GetX package to your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5
```

#### 2. Create the Counter Controller
Create a `counter_controller.dart` file and define the counter logic:
```dart
import 'package:get/get.dart';

class CounterController extends GetxController {
  // Define an observable variable
  var count = 0.obs;

  // Method to increment the count
  void increment() {
    count++;
  }
}
```

#### 3. Initialize GetX in the Main File
In your `main.dart` file, initialize GetX and set up the UI:
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  // Instantiate the controller
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Use Obx to listen to changes
            Obx(() => Text(
                  '${controller.count}',
                  style: Theme.of(context).textTheme.headline4,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
```

#### 4. Run the App
Run your app using `flutter run` to see the counter in action.

### Key Points:
- **GetX Controller**: Manages the state and business logic.
- **Obs**: Makes a variable observable.
- **Obx Widget**: Rebuilds UI when the observable variable changes.
- **Get.put()**: Instantiates the controller and makes it available throughout the app.

Using GetX simplifies state management and makes your code more readable and maintainable. Enjoy building your Flutter apps with GetX!




<img src = "https://github.com/user-attachments/assets/1f67d78f-976c-4bc3-aa8c-b605d4173bc3" width=22% height=35%>

https://github.com/user-attachments/assets/5a743572-3799-4992-9764-5e52267705a0


