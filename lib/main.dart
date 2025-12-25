import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sa7ty/core/services/cashing.dart';
import 'package:sa7ty/core/utils/colors.dart';
import 'package:sa7ty/core/utils/fonts.dart';
import 'package:sa7ty/firebase_options.dart';
import 'package:sa7ty/feature/intro/splachscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await appcashing.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
      ],
      localizationsDelegates: const[
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,
         GlobalCupertinoLocalizations.delegate,

      ],
      theme: ThemeData(
          fontFamily: 'Cairo',
          appBarTheme: AppBarTheme(),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Appcolors.secondary,
            filled: true,
            hintStyle: getsmallstyle(size: 15, color: Appcolors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: Appcolors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: Appcolors.white),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: Colors.red),
            ),
          )),
      debugShowCheckedModeBanner: false,
      
      home: Splachscreen(),
    );
  }
}
