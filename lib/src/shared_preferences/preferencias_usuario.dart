import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //ninguna de estas propiedades se usa
  bool _colorSecundario;
  int _genero;
  String _nombre;

  get genero=>_prefs.getInt('genero')??1;
  set genero(int value){
    _prefs.setInt('genero', value);
  }

  get colorSecundario=>_prefs.getBool('colorSecundario')??false;
  set colorSecundario(bool value){
    _prefs.setBool('colorSecundario', value);
  }

  get nombreUsuario=>_prefs.getString('nombreUsuario')??'';
  set nombreUsuario(String value){
    _prefs.setString('nombreUsuario', value);
  }

  get ultimaPagina=>_prefs.getString('ultimaPagina')??'home';
  set ultimaPagina(String value){
    _prefs.setString('ultimaPagina', value);
  }
}