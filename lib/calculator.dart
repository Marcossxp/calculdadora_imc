import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
    double weight = 0;
    double height = 0;
    double imc = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 217, 211, 150),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 71, 148, 129),
        title: Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network('https://m.media-amazon.com/images/I/51V+Po3QJmL.png'),
              width: 150,
              height: 200,
            ),
            SizedBox(
              width: 410,
              height: 70,
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
              setState(() {
                weight = double.tryParse(value) ?? 0;
              });
            },
            decoration: InputDecoration(
              labelText: "Peso (kg)",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
                  ),
                ),  
              ),
            ),  
            SizedBox(
          width: 410,
          height: 70 ,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value){
              setState(() {
                height = double.tryParse(value) ?? 0;
              });
            },
            decoration: InputDecoration(
              labelText: "Altura (cm)",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
          ), 
          ElevatedButton(onPressed: (){
            setState(() {
              imc = weight / ((height/100)*(height/100));
            });
          },
          child: Text("Calcular"),
          ),
          SizedBox(height: 20),
          Text(
            "IMC:${imc.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.white,fontSize: 25),
          ),
          Text(getIMCStatus(imc),
          style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),
          ),

          ],
        ),
      ),
    );
  }
  String getIMCStatus(double imc){
    if (imc < 18.5) {
      return "Abaixo do Peso";
    }else if (imc < 24.9){
      return 'Peso Normal';
    }else if (imc < 29.9){
      return "Sobrepeso";
    }else if (imc < 34.9){
      return "Obsedidade Grau I";
    }else if (imc < 39.9){
      return "Obesidade Grau II";
    }else{
      return 'Obesidade Grau III';
    }
  }
}