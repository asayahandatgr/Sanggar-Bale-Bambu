import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanggar_budaya/presentation/screen/begin_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const SanggarBudayaApp()));
}

class SanggarBudayaApp extends StatelessWidget {
  const SanggarBudayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanggar Budaya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC107),
        useMaterial3: true,
      ),
      home: const BeginScreen(),
    );
  }
}
