abstract class AppState {}

class InititalState extends AppState{}
class ChangeBottomBarState extends AppState {}
class NewsGetBusinessDataSuccessState extends AppState {}
class NewsGetBusinessLodaingState extends AppState {}
class NewsGetBusinessDataErrorState extends AppState {
  final String error ;
  NewsGetBusinessDataErrorState({required this.error});
}
class NewsGetSportDataSuccessState extends AppState {}
class NewsGetSportLodaingState extends AppState {}
class NewsGetSportDataErrorState extends AppState {
  final String error ;
  NewsGetSportDataErrorState({required this.error});
}
class NewsGetScienceDataSuccessState extends AppState {}
class NewsGetScienceLodaingState extends AppState {}
class NewsGetScienceDataErrorState extends AppState {
  final String error ;
  NewsGetScienceDataErrorState({required this.error});
}
class NewsGetSearchDataSuccessState extends AppState {}
class NewsGetSearchLodaingState extends AppState {}
class NewsGetSearchDataErrorState extends AppState {
  final String error ;
  NewsGetSearchDataErrorState({required this.error});
}
class ChangeThemeToDarkState extends AppState {}
class ChangeThemeToLightState extends AppState {}
