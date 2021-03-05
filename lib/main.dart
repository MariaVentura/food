
import 'package:flutter/material.dart';
import 'package:food/pages/detalle_pagina.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

//stful - abrir otra página
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF0000),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Comida a domicilio',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 105.0, //Responsive
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(75.0),
                    bottomLeft: Radius.circular(75.0))),
            child: Container(
              height: MediaQuery.of(context).size.height - 200.0,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 0.1,
                childAspectRatio: 0.700,
                children: <Widget>[
                  //Como no se conecta a una DB se simulará un Widget que pinte la información
                  _comidaItem('Burger King', 25, 'assets/images/food1.png'),
                  _comidaItem('Pizza Hut', 39, 'assets/images/food2.png'),
                  _comidaItem('KFC', 12, 'assets/images/food3.png'),
                  _comidaItem('Burger', 15, 'assets/images/food4.png'),
                  _comidaItem('Sushi', 27, 'assets/images/food5.png'),
                  _comidaItem('Tailandesa', 38, 'assets/images/food6.png'),
                  _comidaItem('Ensalada', 35, 'assets/images/food7.png'),
                  _comidaItem('Nachos', 30, 'assets/images/food8.png'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _comidaItem(String nombre, int precio, String imagen) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Container(
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Color(0xFFE6E4EB),
          elevation: 5,
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: imagen,
                child: new Material(
                    child: Container(
                        color: Color(0xFFE6E4EB), //Color fondo imagen
                        //0xFFE2E0E7
                        child: InkWell(
                          //acción al click
                          onTap: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => DetallePagina(
                                      nombre: nombre,
                                      precio: precio,
                                      imagen: imagen))),
                          child: new Image.asset(
                            imagen,
                            fit: BoxFit.contain,
                            width: 130,
                            height: 130,
                          ),
                        )
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
              ),
              Text(
                nombre,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.all(3.0),
              ),
              Text(
                precio.toString(),
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
