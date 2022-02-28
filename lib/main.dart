import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habbit_app/app_styles.dart';
import 'package:habbit_app/views/onboarding_page.dart';
import 'package:habbit_app/views/authentication/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnBoard;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnBoard = pref.getBool('seenOnBoard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habit App',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackground,
      ),
      home: seenOnBoard == true ? SignUpPage() : OnBoardingPage(),
    );
  }
}
