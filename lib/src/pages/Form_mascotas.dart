import 'package:flutter/material.dart';


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

String _opcionraza = 'Labrador';
String _opcionsexo = 'Macho';
String _opciontipo = 'Perro';
List<String> _sexos = ['Macho', 'Hembra'];
List<String> _razas = ['Labrador', 'Husky', 'Golden', 'Angora', 'Pantera', ];
List<String> _tipos = ['Ave', 'Perro', 'Gato', 'Mamifero Pequeño', 'Pez', ];

TextEditingController _inputFieldDateController = new TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Información Mascota'),
    ),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: <Widget>[
        _crearInput(),
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
        ],
    ),
  );
}

Widget _crearInput() {
return TextField(
    // autofocus: true,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)),
      counter: Text('Letras ${ _nombre.length }'),
      hintText: 'Nombre Mascota',
      labelText: 'Nombre Mascota',
      helperText: 'Sólo es el nombre',
      suffixIcon: Icon( Icons.accessibility ),
      icon: Icon( Icons.account_circle )
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
        keyboardType: TextInputType.emailAddress,
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
        obscureText: true,
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
        obscureText: true,
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

  // Widget _crearPersona() {
  //   return ListTile(
  //     title: Text('Nombre es: $_nombre'),
  //     subtitle: Text('Email: $_email'),
  //     trailing: Text(_opcionSeleccionada),
  //   );
  // }
}
