import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/BLO/states.dart';
import 'package:newsapi/pages/science.dart';
import 'package:newsapi/pages/settings.dart';
import 'package:newsapi/pages/sports.dart';
import 'package:newsapi/remote/diohelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/business.dart';

class newsCubit  extends Cubit<newsState> {
  newsCubit():super(initialNews());

  static newsCubit get(context) => BlocProvider.of(context);
 int currentIndex =0;
 List<Widget> screen =[
   busines(),
   sports(),
   science(),
   settings()
 ];

 void changeIndex({required index}){
   currentIndex = index;
   if(currentIndex==1){getSport ();}
   if(currentIndex==2){getScience ();}
   emit(changeIndex0());
 }

 List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined),label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
  ];

  List<dynamic> sport =[];
  void getSport (){
    emit(loadingSports());
    dioHelper.getDaata(url:"v2/top-headlines", query: {
      "country":"eg",
      "category":"sports",
      "apiKey":"65f7f556ec76449fa7dc7c0069f040ca"
    } ).then((value) {
      sport =value.data["articles"];
      print(sport[0]["title"]);
      emit(gatSports());
    }).catchError((error){
      print(error.toString());
      emit(errorSports());
    });
  }

  List<dynamic> science0 =[];
  void getScience (){
    emit(loadingScience());
    dioHelper.getDaata(url:"v2/top-headlines", query: {
      "country":"eg",
      "category":"science",
      "apiKey":"65f7f556ec76449fa7dc7c0069f040ca"
    } ).then((value) {
      science0 =value.data["articles"];
      print(science0[0]["title"]);
      emit(gatScience());
    }).catchError((error){
      print(error.toString());
      emit(errorScience());
    });
  }
  bool isDark = false;

   changeMode(){
     isDark = !isDark;
       emit(changeModeLight());
     }
  // void cacheHelper ({required String key,required bool value}) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool(key, value);
  // }

  List<dynamic> search =[];
  void getSearch (String value){
    emit(loadingSearch());
    search=[];
    dioHelper.getDaata(
        url:"v2/everything",
        query: {
      "q":"${value}",
      "apiKey":"65f7f556ec76449fa7dc7c0069f040ca"
    } ).then((value) {
      search =value.data["articles"];
      print(search[0]["title"]);
      emit(gatSearch());
    }).catchError((error){
      print(error.toString());
      emit(errorSearch());
    });
  }

  }


//  static init() async {
//    sharedPreferences = await SharedPreferences.getInstance() ;
//  }
//
// static Future<bool> putBoolen ({required String key,required bool value }){
//  return  sharedPreferences.setBool(key, value);
//  }
//
//  static  getBoolen ({required String key })  {
//     return sharedPreferences.getInt(key);
//  }
