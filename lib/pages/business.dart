import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/Companted.dart';

import '../BLO/cubit.dart';
import '../BLO/states.dart';

class busines extends StatelessWidget {
  const busines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = newsCubit.get(context).business;
    return bodyBuilder (list,context);
  }
}
