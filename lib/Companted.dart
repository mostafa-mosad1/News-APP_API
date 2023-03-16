import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/pages/webView.dart';

import 'BLO/cubit.dart';
import 'BLO/states.dart';

Widget design (ali,context) => Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          image: DecorationImage(image: NetworkImage("${ali["urlToImage"]}"),
              fit:BoxFit.cover),),
        width: 150,
        height: 150,
      ),
      SizedBox(width: 10,),
      Expanded(child: Container(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text("${ali["title"]}",maxLines:5,overflow:TextOverflow.ellipsis,style:Theme.of(context).textTheme.bodyText1,)),
            Text("${ali["publishedAt"]}",style:TextStyle(fontSize: 18,color: Colors.grey)),
          ],),
      ))
    ],
  ),
);
Widget divider () => Container(width: 1,height: 1,color:Colors.cyan);

Widget bodyBuilder (list,context) =>    BlocConsumer<newsCubit, newsState>(

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


Widget defultForm ({
  required  Controller,
  required validator,
  labelText,
  hintText,
  prefixIcon,
  double circular=10,
  change

})

=>TextFormField(

  keyboardType: TextInputType.emailAddress,
  controller: Controller ,
  validator: validator,
  decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circular),
          borderSide: BorderSide(color: Colors.redAccent)),
  ),onChanged: change,
);