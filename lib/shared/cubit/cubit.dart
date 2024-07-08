import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business_screen/businessScreen.dart';
import 'package:newsapp/modules/science_screen/scienceScreen.dart';
import 'package:newsapp/modules/settings_Screen/settingsScreen.dart';
import 'package:newsapp/modules/sports_screen/sportsScreen.dart';
import 'package:newsapp/shared/cubit/status.dart';
import 'package:newsapp/shared/network/local/cash_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InititalState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDarkMode = false;

  void changeTheme({bool? isDark}) {
    if (isDark != null) {
      isDarkMode = isDark;
      print(isDark);
    } else {
      isDarkMode = !isDarkMode;
    } // Toggle the state
    if (isDarkMode) {
      CashHelper.putBool(key: 'key', value: isDarkMode).then((onValue) {
        emit(ChangeThemeToDarkState());
      });
      // Emit event for dark mode
    } else {
      CashHelper.putBool(key: "key", value: isDarkMode).then((onValue) {
        emit(ChangeThemeToLightState());
      });
      // Emit event for light mode
    }
  }

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: "Business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball), label: "Sports"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];

  List<Widget> bottomScreens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeBottomBarIndex(int index) {
    currentIndex = index;
    if (index == 1) getSport();
    if (index == 2) getScience();
    emit(ChangeBottomBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLodaingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '21a1ea189138417db2ec8bffd5c373dc',
    }).then((value) {
      business = value.data['articles'];
      print(value.data['title']);
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((erorr) {
      emit(NewsGetBusinessDataErrorState(error: erorr.toString()));
      print(erorr.toString());
    });
  }

  List<dynamic> sport = [];

  void getSport() {
    emit(NewsGetSportLodaingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '21a1ea189138417db2ec8bffd5c373dc',
    }).then((value) {
      sport = value.data['articles'];
      print(value.data['title']);
      emit(NewsGetSportDataSuccessState());
    }).catchError((error) {
      emit(NewsGetSportDataErrorState(error: error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLodaingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '21a1ea189138417db2ec8bffd5c373dc',
    }).then((value) {
      science = value.data['articles'];
      print(value.data['title']);
      emit(NewsGetScienceDataSuccessState());
    }).catchError((erorr) {
      emit(NewsGetScienceDataErrorState(error: erorr.toString()));
      print(erorr.toString());
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLodaingState());

    search = [];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
      'q': '$value',
      'apiKey': '21a1ea189138417db2ec8bffd5c373dc',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchDataSuccessState());
    }).catchError((erorr) {
      emit(NewsGetSearchDataErrorState(error: erorr.toString()));
      print(erorr.toString());
    });
  }
}
