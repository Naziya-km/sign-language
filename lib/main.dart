// import 'package:flutter/material.dart';
// import 'sign_detection_page.dart';

// void main() {
//   runApp(
//     MaterialApp(debugShowCheckedModeBanner: false, home: SignDetectionPage()),
//   );
// }
import 'package:flutter/material.dart';

import 'package:model/homee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StatisticsPage());
  }
}
