import 'dart:async';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:safe_through/ui/screens/splash/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/styles.dart';

safeThroughPP() {
  launchUrl(Uri.parse(
      'https://www.canva.com/design/DAGLxanYwTI/CU9I_0aximzafO9J9jWeQA/edit?utm_content=DAGLxanYwTI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'));
}

safeThroughTOU() {
  launchUrl(Uri.parse(
      'https://www.canva.com/design/DAGLxQZ3Kzo/rjAcVW0CYfe_23APeVLxdA/edit?utm_content=DAGLxQZ3Kzo&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton'));
}

const safeThroughHudKey = 'app_uxRXCGH8QUwdr3hHh32bpBVhWpi68C';
const safeThroughSubID = 'safe_premium';
late ApphudProduct safeThroughSubProduct;
late String safeThroughSubPrice;
ValueNotifier<bool> safeThroughSubActive = ValueNotifier<bool>(false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Apphud.start(apiKey: safeThroughHudKey);

  preferences = await StreamingSharedPreferences.instance;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

late StreamingSharedPreferences preferences;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var appKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: appKey,
        debugShowCheckedModeBanner: false,
        theme: DCheckTheme.lightTheme,
        home: const SplashScreen());
  }
}
