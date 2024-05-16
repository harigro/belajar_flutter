import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: SizedBox(
          width: 600,
          height: 600,
          child: KalkulatorScreen(),
        ),
      ),
    );
  }
}

class KalkulatorScreen extends StatefulWidget {
  @override
  _KalkulatorScreenState createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  String input = '';
  String result = '0';

  void onPressed(String text) {
    setState(() {
      if (text == 'AC') {
        input = '';
        result = '0';
      } else if (text == '⌫') {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : '';
        result = input.isNotEmpty ? input : '0';
      } else if (text == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(input);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          // Menampilkan hasil hanya di tempat kedua
          result = eval.toString();
          input = '';
        } catch (e) {
          result = 'Error';
        }
      } else {
        // Menambahkan teks ke input hanya di tempat pertama
        input += text;
        result = '0'; // Mengatur hasil kembali ke 0 setiap kali tombol ditekan
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pretty Fast Calculation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              input,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('0'),
              buildButton('.'),
              buildButton('AC'),
              buildButton('⌫'),
              buildButton('+'),
              buildButton('='),
            ],
          ),
          SizedBox(height: 20), // Menambahkan jarak di bawah tombol
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return Expanded(
      // Menggunakan Expanded agar tombol menempati ruang yang tersedia
      child: ElevatedButton(
        onPressed: () => onPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
