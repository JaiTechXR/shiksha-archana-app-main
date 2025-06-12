import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shikshaarchana/firebase_options.dart';
import 'package:shikshaarchana/preferences.dart';
import 'package:shikshaarchana/src/presentation/dashboard/dashboard.dart';
import 'package:shikshaarchana/src/presentation/languagescreen/languagescreen.dart';
import 'package:shikshaarchana/src/presentation/splashscreen/splashscreen.dart';
import 'Applocalization/Applocalization.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF25265F), // navigation bar color
    statusBarColor: Color(0xFF25265F), // status bar color
  ));
  AppLanguage appLanguage = AppLanguage();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  MyApp({Key? key, required this.appLanguage}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("hello");
    //SessionManager().cleanPrefernces();
    // print(SessionManager.getString(Constant.Token)) ;
    // ignore: missing_required_param
    return ChangeNotifierProvider<AppLanguage>(
      create: (context) => widget.appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: model.appLocal,
              localizationsDelegates: [
                const TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('en', ''),
                const Locale('hi', ''),
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocaleLanguage in supportedLocales) {
                  if (supportedLocaleLanguage.languageCode ==
                          locale!.languageCode &&
                      supportedLocaleLanguage.countryCode ==
                          locale.countryCode) {
                    return supportedLocaleLanguage;
                  }
                }
                return supportedLocales.first;
              },
              initialRoute: '/',
              routes: <String, WidgetBuilder>{'/': (context) => splash()},
            );
          },
        );
      }),
    );
  }
}
