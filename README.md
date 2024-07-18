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


FirstScreen.dart:

dart
Copy code
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(SecondScreen());
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}
SecondScreen.dart:

dart
Copy code
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Second Screen!'),
      ),
    );
  }
}
Explanation
Get.to(SecondScreen()): This method from GetX package is used for navigation. It pushes the SecondScreen onto the navigation stack.
App Structure: Ensure both screens are properly structured with AppBar and Scaffold for a complete layout.
Using GetX for navigation simplifies the process, making it cleaner and more readable.


<img src = "https://github.com/user-attachments/assets/1d09b914-8f83-4046-92d9-7513c7d70057" width=22% height=35%>
<img src = "https://github.com/user-attachments/assets/85005e95-6743-4e0e-8f04-f143347b4ff1" width=22% height=35%>

https://github.com/user-attachments/assets/519210bd-022c-4700-9eea-1ba390e9d445


Using the GetX package in Flutter for theme management allows you to easily switch between light and dark themes or even customize themes dynamically. Here’s a step-by-step guide to implement theme change functionality using GetX:

### Step 1: Add Dependencies
Add `get` to your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.3.8
```

### Step 2: Create a Theme Controller
Create a `ThemeController` class to manage the theme state.
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class ThemeController extends GetxController
{
  RxBool theme =false.obs;

  void ChnageTheme(bool value)
  {
    theme.value= value;
    Get.changeTheme(theme.value? darkTheme:lightTheme);
  }


}

### Step 3: Initialize the Controller
Initialize the `ThemeController` in your main application file.
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ThemeController
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
          title: 'Flutter Theme Change with GetX',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.theme,
          home: HomePage(),
        ));
  }
}
```

### Step 4: Create the Home Page
Create a `HomePage` widget to toggle the theme.
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Change with GetX'),
        actions: [
          IconButton(
            icon: Icon(themeController.isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Hello, GetX!'),
      ),
    );
  }
}
```

### Step 5: Run Your App
Run your app to see the theme change in action.

This setup provides a reactive way to handle theme changes using GetX, allowing for a smooth and efficient user experience. The `Obx` widget listens for changes in the `ThemeController` and updates the theme accordingly when the `toggleTheme` method is called.




<img src = "https://github.com/user-attachments/assets/d01dbbc6-c19f-4656-81d6-37a3984ee91d" width=22% height=35%>



https://github.com/user-attachments/assets/4a95c8b5-7104-4a37-b5db-67cc1977ab90





