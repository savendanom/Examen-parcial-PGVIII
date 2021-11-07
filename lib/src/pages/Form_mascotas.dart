import 'package:flutter/material.dart';
import 'package:clase_3/src/utils/icono_string_util.dart';


class FormMascotas extends StatefulWidget {
  @override
  _InputPageMascotas createState() => _InputPageMascotas();
}

class _InputPageMascotas extends State<FormMascotas> {

String _nombre = '';
String _nombrepropietario  = '';
String _telefonod  = '';
String _edad = '';
String _fecha = '';
List _registro = [];

String _opcionraza = 'Labrador';
String _opcionsexo = 'Macho';
String _opciontipo = 'Perro';
List<String> _sexos = ['Macho', 'Hembra'];
List<String> _razas = ['Labrador', 'Husky', 'Golden', 'Angora', 'Pantera', ];
List<String> _tipos = ['Ave', 'Perro', 'Gato', 'Mamifero Pequeño', 'Pez', ];

TextEditingController _inputFieldDateController = new TextEditingController();

  get floatingActionButton => null;

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Información Mascota'),
    ),
    body:GridView.count(
      crossAxisCount: 1,
      children: [
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearnombrem(),
            Divider(),
            _crearnombrepropietario(),
            Divider(),
            _creartelefono(),
            Divider(),
            _crearraza(),
            Divider(),
            _crearsexo(),
            Divider(),
            _crearedad(),
            Divider(),
            _creartipo(),
            Divider(),
            _crearFecha( context ),
            Divider(),
            _crearbuild(context),
          ],
        ),
        _lista(),
      ]
    ),
  floatingActionButton: FloatingActionButton(
  child: Icon(Icons.save),
  onPressed: () {
   _guardar();

    //Navigator.pop(context);
  }),
  );
}

Widget _crearnombrem() {
return TextField(
    // autofocus: true,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)),
      counter: Text('Letras ${ _nombre.length }'),
      hintText: 'Nombre Mascota',
      labelText: 'Nombre Mascota',
      helperText: 'Sólo es el nombre',
      suffixIcon: Icon( Icons.pets ),
      icon: Icon( Icons.pets )
    ),
    onChanged: (valor){
      setState(() {
        _nombre = valor;
      });
    },
  );
}

Widget _crearnombrepropietario() {
    return TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre Propietario',
            labelText: 'Nombre Propietario',
            helperText: 'Nombre y Apellido',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (valor) => setState(() {
              _nombrepropietario = valor;
            }));
}

Widget _creartelefono() {
    return TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Telefono',
            labelText: 'Telefono',
            suffixIcon: Icon(Icons.phone),
            icon: Icon(Icons.phone)),
        onChanged: (valor) => setState(() {
              _telefonod = valor;
            }));
}

Widget _crearedad() {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Edad Mascota',
            labelText: 'Edad Mascota',
            suffixIcon: Icon(Icons.pets),
            icon: Icon(Icons.pets)),
        onChanged: (valor) => setState(() {
              _edad = valor;
            }));
}

Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }
  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
}

List<DropdownMenuItem<String>> getOpcionesDropdown() {
List<DropdownMenuItem<String>> lista = new List();
    _sexos.forEach((sexo) {
          lista.add(DropdownMenuItem(
          child: Text(sexo),
          value: sexo,
          ));
     });
      return lista;
}

  List<DropdownMenuItem<String>> getOpcionesDropdown1() {
  List<DropdownMenuItem<String>> lista1 = new List();
      _razas.forEach((raza) {
      lista1.add(DropdownMenuItem(
        child: Text(raza),
        value: raza,
      ));
    });
    return lista1;
    }
List<DropdownMenuItem<String>> getOpcionesDropdown2() {
List<DropdownMenuItem<String>> lista2 = new List();
    _tipos.forEach((tipo) {
      lista2.add(DropdownMenuItem(
        child: Text(tipo),
        value: tipo,
      ));
    });
     return lista2;
 }
Widget _crearsexo() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionsexo,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionsexo = opt;
              });
            },
          ),
        )
      ],
    );
}

Widget _crearraza() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionraza,
            items: getOpcionesDropdown1(),
            onChanged: (opt) {
              setState(() {
                _opcionraza = opt;
              });
            },
          ),
        )
      ],
    );
}

Widget _creartipo() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opciontipo,
            items: getOpcionesDropdown2(),
            onChanged: (opt) {
              setState(() {
                _opciontipo = opt;
              });
            },
          ),
        )
      ],
    );
}

Widget _crearbuild(BuildContext context) {
    return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
      child: RaisedButton(
        child: Text('Ver informacion'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () => _mostrarAlert(context),
      ),
    // floatingActionButton: FloatingActionButton(
    //   child: Icon(Icons.add_location),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    ),
    ],
  );
}

void _mostrarAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Datos Mascota'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Nombre Propietario:'),Text('$_nombrepropietario'),
              Text('Telefono:'),Text('$_telefonod'),
              Text('Datos Mascota:'),Text('$_nombre'),
              Text('$_opcionraza'),
              Text('$_opcionsexo'),
              Text('$_edad Años'),
              Text('$_opciontipo'),
              Text('$_fecha'),
             // FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Editar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('Guardar'),
              onPressed: () {
              Navigator.of(context).pop();
              Map<String, dynamic> pet = {
                        'nombreMascota': _nombre,
                        'nombrePropietario': _nombrepropietario,
                        'telefono': _telefonod,
                        'raza': _opcionraza,
                        'sexo': _opcionsexo,
                        'edadMascota': _edad,
                        'tipoMascota': _opciontipo,
                        'nacimiento': _fecha
                      };
                      setState(() {
                        _registro.add(pet);
                      });

             }
            ),
          ],
        );
      });
}
  Widget _lista() {
    return ListView(
       children: _listaItems(_registro, context),
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text('$_nombre $_nombrepropietario $_telefonod $_opcionraza $_opcionsexo $_edad $_opciontipo'),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });
    return opciones;
  }
 void _guardar() {
          Map<String, dynamic> pet = {
            'nombreMascota': _nombre,
            'nombrePropietario': _nombrepropietario,
            'telefono': _telefonod,
            'raza': _opcionraza,
            'sexo': _opcionsexo,
            'edadMascota': _edad,
            'tipoMascota': _opciontipo,
            'nacimiento': _fecha
          };
          setState(() {
            _registro.add(pet);
          });
  }
}
