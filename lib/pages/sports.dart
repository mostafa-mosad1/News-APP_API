import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLO/cubit.dart';
import '../BLO/states.dart';
import '../Companted.dart';

class sports extends StatelessWidget {
  const sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = newsCubit.get(context).sport;
    return bodyBuilder (list,context);
  }
}
