import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/componant.dart/componant.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          List search = AppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(
              title: Text("Search"),
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      label: const Text("Search"),
                      prefixIcon: const Icon(Icons.search),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onFieldSubmitted: (String value) {
                      AppCubit.get(context).getSearch(value);
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Expanded(child: NewsBuilder(search, context)),
                ],
              ),
            ),
          );
        });
  }
}
