import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetallePagina extends StatefulWidget {
  final nombre;
  final precio;
  final imagen;

  const DetallePagina({this.nombre, this.precio, this.imagen});

  @override
  _DetallePaginaState createState() => _DetallePaginaState();
}

class _DetallePaginaState extends State<DetallePagina> {
  int _counter = 0;
  int _total = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _calcular() {
    var numero1 = widget.precio;

    int numero2 = _counter;

    int result = numero1 * numero2;

    setState(() {
      _total = result;
      print(_total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFD0202),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.restaurant_menu),
              onPressed: null,
              color: Colors.green),
        ],
        title: Text('DETALLE',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white70)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent, //Cabecera
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 102.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                  top: 15.0,
                  right: 80.0,
                  bottom: 25,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFE6E4EB),
                        //0xFFE6E4EB
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45.0),
                            bottomRight: Radius.circular(45.0))),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                  //Imagen
                  top: (MediaQuery.of(context).size.width / 2) + 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 47.0,
                  child: Hero(
                    tag: widget.imagen,
                    child: Container(
                      //Imagen producto
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          image: DecorationImage(
                              image: AssetImage(widget.imagen),
                              fit: BoxFit.contain)),
                      height: 228.0,
                      width: 228.0,
                    ),
                  )),
              Positioned(
                  top: 50.0,
                  left: 25.0,
                  right: 25.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.nombre, //nombre del producto
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.black)),
                      SizedBox(
                        height: 28.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text('Precio: ',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                  color: Colors.black)),
                          Text(widget.precio.toString(),
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                  color: Colors.black)),
                          SizedBox(
                            height: 28.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Text('Cantidad: $_counter',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.black)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            //Colors.grey[700],
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6.0,
                                color: Colors.grey[400],
                                offset: Offset(0.0, 1.0), //Sombra
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(45.0),
                              bottomLeft: Radius.circular(45.0),
                            )),
                        margin: EdgeInsets.only(top: 40.0),
                        padding: EdgeInsets.all(3.0), //ancho
                        child: new Column(
                          children: <Widget>[
                            SizedBox(
                              height: 28.0,
                            ),
                            new IconButton(
                                icon: new Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _incrementCounter();
                                  _calcular();
                                }),
                            new IconButton(
                                icon: new Icon(
                                  Icons.fiber_smart_record,
                                ),
                                onPressed: () {}),
                            new IconButton(
                                icon: new Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  _decrementCounter();
                                  _calcular();
                                }),
                            SizedBox(
                              height: 28.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      Container(
                        //Total
                        margin: EdgeInsets.only(
                            //right: 80.0,
                            left: 120.0,
                            top: 120.0,
                            //bottom: 80.0
                        ),
                        padding: EdgeInsets.all(10.0),
                        height: 40.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0xFFE6E4EB),
                                //Colors.grey[300],
                                offset: Offset(0.0, 1.0))
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0)
                            ),
                          color: Color(0xFFE6E4EB),
                        ),

                        child: Text(
                          'TOTAL: $_total',
                          style: new TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
