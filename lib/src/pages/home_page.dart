import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario)?Colors.teal:Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Colors secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombreUsuario}'),
        ]
      ),
    );
  }

}