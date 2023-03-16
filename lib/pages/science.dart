import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLO/cubit.dart';
import '../BLO/states.dart';
import '../Companted.dart';

class science extends StatelessWidget {
  const science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = newsCubit.get(context).science0;
    return   BlocConsumer<newsCubit, newsState>(

        listener: (context, state) {},

        builder: (context, state) {

          return ConditionalBuilder(

            condition: list.length>0, // is! loadingData ,

            builder:(context) =>
                ListView.separated(
                    physics:BouncingScrollPhysics(),

                    itemBuilder:(context, index) => design(list[index],context) ,

                    separatorBuilder: (context, index) =>divider(),

                    itemCount: list.length ) ,

            fallback:(context) => Center(child: CircularProgressIndicator()) , );

        });
  }
}
