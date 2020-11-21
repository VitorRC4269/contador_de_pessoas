import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _money = 0.0;
  String _infoText = "Você está quebrado!";
  int _custo = 10;
  double _mult = 1.0;

  void _resetFields() {
    setState(() {
      _money = 0.0;
      _mult = 1.0;
      _custo = 10;
      _infoText = "Você está quebrado!";
    });
  }

  void _changeMoney(int delta, double m) {
    setState(() {
      _money += delta * m;

      if (_money <= 0.0) {
        _infoText = "Você está quebrado!";
      } else if (_money > 0.0 && _money < 1039.0) {
        _infoText = "Tem nem um salário mínimo!";
      } else if (_money > 1039.0 && _money < 10000.0) {
        _infoText = "Graninha razoável";
      } else if (_money > 10000.0 && _money < 1000000.0) {
        _infoText = "Um bom dinheiro";
      } else {
        _infoText = "Parabéns! Você é milionário!";
      }
    });
  }

  void _investir() {
    setState(() {
      //_changeMoney(_custo);
      if (_money >= _custo) {
        _changeMoney(_custo, -1.0);
        _custo = _custo * 5;

        _mult *= 2.05;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blu€Coin Investimentos"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.centerRight,
          child: Stack(
        children: <Widget>[
          Image.asset(
            "images/investimentos.jpeg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Dinheiro: R\$${_money.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    child: Text(
                      "Resgatar dinheiro: R\$${_mult.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeMoney(1, _mult);
                    },
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    child: Text(
                      "Investir: R\$${_custo.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _investir();
                    },
                  )),
              Text(
                _infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0),
              )
            ],
          ),
        ],
      )),
    );
  }
}
