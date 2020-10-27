import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/shared_preferences/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;

  TextEditingController _textController;
  final prefs = PreferenciasUsuario();

  @override
  void initState(){
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero          = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController  = TextEditingController(text: prefs.nombreUsuario);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario)?Colors.teal:Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold))
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value){
              prefs.colorSecundario = value;
              _colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            title: Text('Masculino'),
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            title: Text('Femenino'),
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value){
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
    );
  }

  Future _setSelectedRadio(int value){
    prefs.genero = value;
    _genero = value;
    setState((){});
  }
}