import 'package:flutter/material.dart';
import 'package:imcapp/imc.dart';
import 'package:imcapp/resultado.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();

  // Lipar os campos da tela:
  void _limparCampos() {
    alturaController.text = "";
    pesoController.text = "";
  }

  void _btnCalcularIMC() {
    //Obtem os valores de altura e peso a partir dos controllers
    //dos campos de texto:
    double alt = double.parse(alturaController.text);
    double pes = double.parse(pesoController.text);

    var myImc = IMC(altura: alt, peso: pes);

    //Realiza a nevegação para a próxima tela (resultado)
    //instanciando o widget IMCResultado e passando os parâmetros
    //necessários:
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => IMCResultado(
                    imc: myImc,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _limparCampos)
          ],
        ),
        
        // O widget SingleChildScrollView permite que o conteúdo da tela 
        // seja rolado e impede que os demais componentes sejam cortados.
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Logotipo da Calculadora
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Icon(
                      Icons.calculate_outlined,
                      color: Colors.blue,
                      size: 80.0,
                    )),

                // Campo para a Altura
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Altura (em metros)'),
                  ),
                ),

                // Campo para o peso
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Peso (kg)'),
                  ),
                ),

                // Botão para efetuar o cálculo
                ElevatedButton(
                  onPressed: _btnCalcularIMC,
                  child: Text('Calcular IMC'),
                ),
              ],
            ),
          ),
        ));
  }
}