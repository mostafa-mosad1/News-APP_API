import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/Companted.dart';

import '../BLO/cubit.dart';
import '../BLO/states.dart';

class searcgScreen extends StatelessWidget {
  searcgScreen({Key? key}) : super(key: key);
  var defultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = newsCubit.get(context).search;
    return BlocConsumer<newsCubit, newsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defultForm(
                      change: (value) {newsCubit.get(context).getSearch(value);},
                      Controller: defultController,
                      circular: 25,
                      prefixIcon: Icons.search,
                      labelText: "search",
                      validator: (dynamic value) {
                        if (value.isEmpty) {
                          return "search is empty";
                        }
                        return null;
                      }),
                ),
           Expanded(child: bodyBuilder (list,context)),
              ],
            ),
          ));
        });
  }
}
