import 'package:flip_client/main.dart';

class NavigationApp{
  static NavigationApp _instance;
  static NavigationApp get instance => _instance != null ? _instance : NavigationApp();

  MyHomePageState _mainState;
  void setMainState(MyHomePageState myHomePageState) {_mainState = myHomePageState; _instance = this;} 
  MyHomePageState get mainState => _mainState;
}