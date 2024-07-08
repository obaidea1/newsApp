import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';

import '../../shared/componant.dart/componant.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).science;
          return list.length > 0
              ? NewsBuilder(list, context)
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
