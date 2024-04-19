import 'package:flutter/material.dart';

class PanjangCalculator extends StatefulWidget {
  const PanjangCalculator({super.key});

  @override
  _PanjangCalculatorState createState() => _PanjangCalculatorState();
}

class _PanjangCalculatorState extends State<PanjangCalculator> {
  final List<String> _satuanList = [
    'Inci',
    'Sentimeter',
    'Kilometer',
    'Hektometer',
    'Dekameter',
    'Meter',
    'Desimeter',
    'Milimeter'
  ];
  String _satuanAwal = 'Inci';
  String _satuanAkhir = 'Sentimeter';
  double _nilaiAwal = 0;
  double _nilaiAkhir = 0;
  String _inputValue = '';

  void _updateInputValue(String value) {
    setState(() {
      if (_inputValue == '0') {
        _inputValue = value;
      } else {
        _inputValue += value;
      }
      _nilaiAwal = double.tryParse(_inputValue) ?? 0;
    });
  }

  bool isInteger(double value) {
    return value == value.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kalkulator Satuan Panjang',
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
            icon: const Icon(Icons.info, size: 35),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.white,
                title: const Text(
                  'Kalkulator Satuan Panjang',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: const Text(
                  'Fitur kalkulator Satuan Panjang akan memudahkan anda melakukan operasi perhitungan seperti penambahan, pengurangan, perkalian dan lain sebagainya.',
                  style: TextStyle(fontSize: 16),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('Mengerti'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        isInteger(_nilaiAwal)
                            ? _nilaiAwal.toStringAsFixed(0)
                            : _nilaiAwal.toString(),
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              )),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: DropdownButton<String>(
                  value: _satuanAwal,
                  items: _satuanList
                      .map((satuan) => DropdownMenuItem(
                            value: satuan,
                            child: Text(satuan,
                                style: const TextStyle(color: Colors.black)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _satuanAwal = value!;
                    });
                  },
                  dropdownColor: Colors.white,
                  underline: Container(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        isInteger(_nilaiAkhir)
                            ? _nilaiAkhir.toStringAsFixed(0)
                            : _nilaiAkhir.toString(),
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              )),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1.5)),
                child: DropdownButton<String>(
                  value: _satuanAkhir,
                  items: _satuanList
                      .map((satuan) => DropdownMenuItem(
                            value: satuan,
                            child: Text(satuan,
                                style: const TextStyle(color: Colors.black)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _satuanAkhir = value!;
                    });
                  },
                  dropdownColor: Colors.white,
                  underline: Container(),
                ),
              ),
            ],
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
          _buildButton('='),
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
      ],
    );
  }

  Widget _buildRow3() {
    return Row(
      children: [
        _buildButton('6'),
        _buildButton('5'),
        _buildButton('4'),
      ],
    );
  }

  Widget _buildRow4() {
    return Row(
      children: [
        _buildButton('1'),
        _buildButton('2'),
        _buildButton('3'),
      ],
    );
  }

  Widget _buildRow5() {
    return Row(
      children: [
        _buildButton('.'),
        _buildButton('0'),
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
              _nilaiAwal = 0;
              _inputValue = '0';
            } else if (text == '=') {
              _konversiNilai();
            } else {
              _updateInputValue(text);
            }
            setState(() {});
          },
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }

  void _konversiNilai() {
    double nilaiKonversi = _nilaiAwal;
    switch (_satuanAwal) {
      case 'Inci':
        nilaiKonversi *= 0.0254;
        break;
      case 'Sentimeter':
        nilaiKonversi *= 0.01;
        break;
      case 'Kilometer':
        nilaiKonversi *= 1000;
        break;
      case 'Hektometer':
        nilaiKonversi *= 100;
        break;
      case 'Dekameter':
        nilaiKonversi *= 10;
        break;
      case 'Desimeter':
        nilaiKonversi *= 0.1;
        break;
      case 'Milimeter':
        nilaiKonversi *= 0.001;
        break;
    }

    switch (_satuanAkhir) {
      case 'Inci':
        _nilaiAkhir = nilaiKonversi / 0.0254;
        break;
      case 'Sentimeter':
        _nilaiAkhir = nilaiKonversi / 0.01;
        break;
      case 'Kilometer':
        _nilaiAkhir = nilaiKonversi / 1000;
        break;
      case 'Hektometer':
        _nilaiAkhir = nilaiKonversi / 100;
        break;
      case 'Dekameter':
        _nilaiAkhir = nilaiKonversi / 10;
        break;
      case 'Desimeter':
        _nilaiAkhir = nilaiKonversi / 0.1;
        break;
      case 'Milimeter':
        _nilaiAkhir = nilaiKonversi / 0.001;
        break;
    }
  }
}