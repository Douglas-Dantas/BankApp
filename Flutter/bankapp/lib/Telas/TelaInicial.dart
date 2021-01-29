import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class TelaInicial extends StatefulWidget {
  TelaInicial({Key key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  bool esconderSaldo = true;
  int _selectedIndex = 0;
  double saldo;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Index 0: Home',
        style: optionStyle,
      ),
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    saldo = 15000.59;
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text("Bem vindo, Douglas"),
              Row(
                children: [
                  Expanded(
                    child: saldoView(),
                    flex: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: btVerSaldo(),
                  )
                ],
              ),
              _widgetOptions.elementAt(_selectedIndex)
            ],
          ),
        ),
      ),
    );
  }

  Widget saldoView() {
    return Container(
        height: 50,
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff5B2434), width: 2.3),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0)),
          color: Color(0x665B2434),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 8,
              child: Text(
                "SALDO:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff5B2434), fontWeight: FontWeight.w900),
              ),
            ),
            !esconderSaldo
                ? Align(
                    child: SkeletonAnimation(
                      child: Container(
                        color: Color(0x115B2434),
                        height: 30,
                        width: 120,
                      ),
                    ),
                  )
                : Align(
                    child: Text(
                      "R\$$saldo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                  )
          ],
        ));
  }

  Widget btVerSaldo() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff5B2434), width: 2.3),
        borderRadius: BorderRadius.only(topRight: Radius.circular(12.0)),
        color: Color(0xff5B2434),
      ),
      height: 50,
      width: 200,
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () => this.setState(() {
          esconderSaldo = !esconderSaldo;
        }),
        child: Container(
          width: 200,
          height: 50,
          child: Icon(
            !esconderSaldo ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
        borderRadius: BorderRadius.only(topRight: Radius.circular(12.0)),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          title: Text("Business"),
        )
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
