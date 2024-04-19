import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukk_kalkulator2/history.dart';
import 'package:ukk_kalkulator2/main.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    _prefs?.clear();
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void showHistoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KalkuHistory()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kalkulator',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leadingWidth: 100,
        leading: Row(
          children: [
            const SizedBox(width: 30),
            Container(
              width: 35,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 20,
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.history, size: 35),
              onPressed: () => showHistoryScreen()),
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  String input = '';
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  String currentInput = '';
  String operator = '';
  String operand = '';
  double result = 0.0;
  List<CalculationHistory> history = [];

  void _saveHistory(String expression, double result) {
    setState(() {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

      history.add(CalculationHistory(formattedDate, expression, result));
      List<String> dataHistory = [
        formattedDate.toString(),
        expression.toString(),
        result.toString()
      ];
      _prefs?.setStringList(formattedDate, dataHistory);
    });
  }

  Widget _buildBody() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildHeader(),
            _buildRow1(),
            _buildRow2(),
            _buildRow3(),
            _buildRow4(),
            _buildRow5(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            input.toString(),
            style: const TextStyle(fontSize: 54),
          )
        ],
      ),
    );
  }

  Widget _buildRow1() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton('AC'),
          _buildButton('C'),
          _buildButton('%'),
          _buildButton('Del'),
        ],
      ),
    );
  }

  Widget _buildRow2() {
    return Row(
      children: [
        _buildButton('7'),
        _buildButton('8'),
        _buildButton('9'),
        _buildButton('+'),
      ],
    );
  }

  Widget _buildRow3() {
    return Row(
      children: [
        _buildButton('6'),
        _buildButton('5'),
        _buildButton('4'),
        _buildButton('-'),
      ],
    );
  }

  Widget _buildRow4() {
    return Row(
      children: [
        _buildButton('1'),
        _buildButton('2'),
        _buildButton('3'),
        _buildButton('x'),
      ],
    );
  }

  Widget _buildRow5() {
    return Row(
      children: [
        _buildButton('.'),
        _buildButton('0'),
        _buildButton('='),
        _buildButton('/'),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(7),
        height: 80,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () {
            if (text == 'AC') {
              setState(() {
                input = '';
                firstNumber = 0.0;
                secondNumber = 0.0;
                operand = '';
                result = 0.0;
              });
            } else if (text == 'C') {
              setState(() {
                input = '';
              });
            } else if (text == '+' ||
                text == '-' ||
                text == 'x' ||
                text == '/') {
              firstNumber = double.parse(input);
              operand = text;
              input = '';
            } else if (text == '%') {
              if (input != '') {
                secondNumber = double.parse(input);
                result = (firstNumber * secondNumber) / 100;
                input = result.toString();
              }
            } else if (text == 'Del') {
              input = input.substring(0, input.length - 1);
            } else if (text == '.') {
              if (!input.contains('.')) {
                input += text;
              }
            } else if (text == '=') {
              secondNumber = double.parse(input);
              switch (operand) {
                case '+':
                  result = firstNumber + secondNumber;
                  break;
                case '-':
                  result = firstNumber - secondNumber;
                  break;
                case 'x':
                  result = firstNumber * secondNumber;
                  break;
                case '/':
                  if (secondNumber == 0) {
                    return;
                  }
                  result = firstNumber / secondNumber;
                  break;
              }
              input = result.toString();
              if (input.endsWith('.0')) {
                input = input.substring(0, input.length - 2);
              }
              _saveHistory('$firstNumber $operand $secondNumber', result);
            } else {
              input += text;
            }

            setState(() {});
          },
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
