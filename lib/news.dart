import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/BLO/cubit.dart';
import 'package:newsapi/BLO/states.dart';
import 'package:newsapi/pages/search_screen.dart';
import 'package:newsapi/remote/diohelper.dart';

class news extends StatelessWidget {
  news({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
                style: TextStyle(),
              ),
              actions: [
                IconButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder:(context) => searcgScreen()));}, icon: Icon(Icons.search)),
                IconButton(onPressed: () {newsCubit.get(context).changeMode();}, icon: Icon(Icons.brightness_4_rounded))
              ],
            ),
            body: newsCubit.get(context).screen[newsCubit.get(context).currentIndex],

            bottomNavigationBar: BottomNavigationBar(
                currentIndex: newsCubit.get(context).currentIndex,
                selectedFontSize: 24,
                onTap: (index) {
                  newsCubit.get(context).changeIndex(index: index);
                },
                items: newsCubit.get(context).item),

            // dioHelper.getDaata(url:"v2/top-headlines", query: {
            //   "country":"eg",
            //   "category":"business",
            //   "apiKey":"65f7f556ec76449fa7dc7c0069f040ca"
            // } ).then((value) {
            //   print(value.data["articles"][0]["title"]);
            // }).catchError((error){
            //   print(error.toString());
            // });
          ));
        });
  }
}

//
// bottomNavigationBar: BottomNavigationBar
// (
// currentIndex: newsCubit.get(context).currentIndex ,
// selectedFontSize:24,
// onTap: (index){
// newsCubit.get(context).changeIndex(index:index);
// },
// items: newsCubit.get(context).item
// ),
