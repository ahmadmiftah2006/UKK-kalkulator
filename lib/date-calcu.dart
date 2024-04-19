import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:datepicker_dropdown/order_format.dart';
import 'package:flutter/material.dart';

class KalkulasiTanggal extends StatefulWidget {
  const KalkulasiTanggal({super.key});

  @override
  State<KalkulasiTanggal> createState() => _KalkulasiTanggalState();
}

class _KalkulasiTanggalState extends State<KalkulasiTanggal> {
  int _selectedStartDay = 0;
  int _selectedStartMonth = 0;
  int _selectedStartYear = 0;

  int _selectedEndDay = 0;
  int _selectedEndMonth = 0;
  int _selectedEndYear = 0;

  String _resultText = '';

  void calculateDateDifference() {
    if (_selectedStartDay != 0 &&
        _selectedStartMonth != 0 &&
        _selectedStartYear != 0 &&
        _selectedEndDay != 0 &&
        _selectedEndMonth != 0 &&
        _selectedEndYear != 0) {
      DateTime startDate =
          DateTime(_selectedStartYear, _selectedStartMonth, _selectedStartDay);
      DateTime endDate =
          DateTime(_selectedEndYear, _selectedEndMonth, _selectedEndDay);

      Duration difference = startDate.difference(endDate);
      int years = difference.inDays ~/ 365;
      int months = (difference.inDays % 365) ~/ 30;
      int days = difference.inDays % 30;

      setState(() {
        _resultText = '$years years $months months $days days';

        print(_resultText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kalkulasi Tanggal',
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
                  'Kalkulasi Tanggal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: const Text(
                  'Fitur kalkulasi Tanggal akan memudahkan anda dalam menentukan jumlah tahun, bulan, minggu dan hari diantara dua tanggal yang telah ditentukan',
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
      body: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start Date',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Select your start date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownDatePicker(
                    locale: "en",
                    dateformatorder: OrderFormat.DMY,
                    inputDecoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        helperText: '',
                        contentPadding: const EdgeInsets.all(0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    isDropdownHideUnderline: true,
                    isFormValidator: true,
                    width: 10,
                    // selectedStartDay: _selectedStartDay,
                    // selectedStartMonth: _selectedStartMonth,
                    // selectedStartYear: _selectedStartYear,
                    onChangedDay: (value) {
                      _selectedStartDay = int.parse(value!);
                      print('Day: $value');
                    },
                    onChangedMonth: (value) {
                      _selectedStartMonth = int.parse(value!);
                      print('Month: $value');
                    },
                    onChangedYear: (value) {
                      _selectedStartYear = int.parse(value!);
                      print('Year: $value');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End Date',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Select your end date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownDatePicker(
                    locale: "en",
                    dateformatorder: OrderFormat.DMY,
                    inputDecoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                        helperText: '',
                        contentPadding: const EdgeInsets.all(0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    isDropdownHideUnderline: true,
                    isFormValidator: true,
                    width: 10,
                    // selectedEndDay: _selectedEndDay,
                    // selectedEndMonth: _selectedEndMonth,
                    // selectedEndYear: _selectedEndYear,
                    onChangedDay: (value) {
                      _selectedEndDay = int.parse(value!);
                      print('Day: $value');
                    },
                    onChangedMonth: (value) {
                      _selectedEndMonth = int.parse(value!);
                      print('Month: $value');
                    },
                    onChangedYear: (value) {
                      _selectedEndYear = int.parse(value!);
                      print('Year: $value');
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: calculateDateDifference,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Date calculation between the date is',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                _resultText.replaceAll('-', ''),
                style: const TextStyle(fontSize: 24),
              )
            ],
          )),
    );
  }
}