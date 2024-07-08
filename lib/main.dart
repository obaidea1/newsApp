import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/bloc_observer.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/status.dart';
import 'package:newsapp/shared/network/local/cash_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import 'layout/new_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getBool(key: 'key');
  runApp(MyApp(isDark: isDark,));

}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp({super.key,this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusiness()..changeTheme(isDark: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            themeMode: AppCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                color: Colors.deepPurpleAccent,
                surfaceTintColor: Colors.deepPurpleAccent,
                elevation: 4.0,
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white,fontSize: 24.0),
              ),
              indicatorColor: Colors.deepPurpleAccent,
              progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.deepPurpleAccent),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepPurpleAccent,
                elevation: 10.0,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black87, fontSize: 16.0),
                bodyMedium: TextStyle(color: Colors.black54, fontSize: 14.0),
                bodySmall: TextStyle(color: Colors.grey, fontSize: 12.0),
                headlineLarge: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20.0),
                headlineMedium: TextStyle(color: Colors.deepPurple, fontSize: 18.0),
                headlineSmall: TextStyle(color: Colors.purple, fontSize: 16.0),
                // Add other text styles as needed
              ),
              buttonTheme: const ButtonThemeData(
                buttonColor: Colors.deepPurpleAccent,
                textTheme: ButtonTextTheme.primary,
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.teal,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const  AppBarTheme(
                color: Colors.teal,
                surfaceTintColor: Colors.teal,
                centerTitle: true,
                elevation: 4.0,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              indicatorColor: Colors.tealAccent,
              progressIndicatorTheme: const  ProgressIndicatorThemeData(color: Colors.tealAccent),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.tealAccent,
                elevation: 10.0,
                unselectedItemColor: Colors.grey,
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white, fontSize: 16.0),
                bodyMedium: TextStyle(color: Colors.white70, fontSize: 14.0),
                headlineLarge: TextStyle(color: Colors.tealAccent, fontSize: 20.0),
              ),
              buttonTheme: const ButtonThemeData(
                buttonColor: Colors.teal,
                textTheme: ButtonTextTheme.primary,
              ),
            ),
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
