import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});


   @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {},
        builder :(context,state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            title: const Text("Newlie"),
            centerTitle: false,
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: const Icon(Icons.search),),
              IconButton(onPressed: (){
                  AppCubit.get(context).changeTheme();
              },
                icon:Icon(AppCubit.get(context).isDarkMode?Icons.brightness_2 :Icons.brightness_2_outlined ),),
            ],

          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem ,
            onTap: (index) {
              cubit.changeBottomBarIndex(index);
            },
            currentIndex: cubit.currentIndex , ),
            body: cubit.bottomScreens[cubit.currentIndex],
        );
  }
      );

  }
}