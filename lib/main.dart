

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapi/news.dart';
import 'package:newsapi/remote/diohelper.dart';
import 'package:newsapi/remote/local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BLO/cubit.dart';
import 'BLO/observer.dart';
import 'BLO/states.dart';

 main() {
   // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => newsCubit()..getBusiness(),
    child: BlocConsumer<newsCubit, newsState>(
    listener: (context, state) {},
    builder: (context, state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(),
        backgroundColor:  Colors.white ,
        elevation: 0,titleTextStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 28,
                color: Colors.black),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 30,unselectedItemColor: Colors.green
        ),textTheme: TextTheme(bodyText1:TextStyle(fontSize: 20,))
     ),
      darkTheme: ThemeData(
          scaffoldBackgroundColor:  HexColor("333739") ,
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(),
            backgroundColor:  HexColor("333739") ,
            elevation: 0,titleTextStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 28,
              color: Colors.white),
            iconTheme: IconThemeData(
                color: Colors.white
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              elevation: 30,unselectedItemColor: Colors.green,
            backgroundColor:  HexColor("333739") ,
          ),
          textTheme: TextTheme(bodyLarge:TextStyle(fontSize: 20)),

      ),
      themeMode: newsCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,

      home: Directionality(textDirection:TextDirection.rtl,child: news())
    );}));
  }

}
