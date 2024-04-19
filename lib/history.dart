import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ukk_kalkulator2/exportExcel.dart';

class KalkuHistory extends StatefulWidget {
  const KalkuHistory({super.key});

  @override
  State<KalkuHistory> createState() => _KalkuHistoryState();
}

class _KalkuHistoryState extends State<KalkuHistory> {
  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Map<String, List<String>> data = {};
  int jumlah_history = 0;
  List<String> keyList = [];

  var newHistory;

  _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String>? keys = prefs.getKeys();
    keyList = keys.toList() ?? [];
    jumlah_history = keys.length ?? 0;
    data = {};
    newHistory = null;

    if (jumlah_history > 0) {
      Map<String, List<String>> newData = {};
      for (var i = 0; i < jumlah_history; i++) {
        final dataPref = {keyList[i]: prefs.getStringList(keyList[i]) ?? []};
        newData.addAll(dataPref);
      }

      setState(() {
        data = newData;
        newHistory = prefs.getStringList(keyList[0]) ?? '';
        print(data);
      });
    }
  }

  void _clearNewHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyList[0]);
    setState(() {
      _loadHistory();
    });
  }

  void _clearAllHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _loadHistory();
    });
  }

  Widget _buildCalculationItem(String date, List<String> values) {
    var expresion = '';
    expresion =
        values[1].substring(0, values[1].length - 2).replaceAll(".0 ", " ");
    var result = '';
    result = values[2].substring(0, values[2].length - 2);

    return Container(
      margin: const EdgeInsets.all(5),
      width: 165,
      // height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(expresion),
        subtitle: Text(
          result,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  String input = '';
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
              icon: const Icon(Icons.report, size: 35),
              onPressed: () {
                exportHistory(context, data);
              }
              ),
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: double.maxFinite,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // ),
                          border: Border.all(color: Colors.black, width: 1.5)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              newHistory != null
                                  ? ('${newHistory[1]} =${newHistory[2]} ')
                                      .replaceAll(".0 ", ' ')
                                  : 'tidak ada history terbaru',
                              style: TextStyle(
                                  fontSize: newHistory != null ? 40 : 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Baru Saja',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () => _clearNewHistory(),
                                child: const Text(
                                  'Clear',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          jumlah_history == 0
                              ? const Center(
                                  child: Text("Tidak Ada History"),
                                )
                              : Wrap(
                                  children: data.entries.map((entry) {
                                    return _buildCalculationItem(
                                        entry.key, entry.value);
                                  }).toList(),
                                ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: GestureDetector(
        onTap: () {
          _clearAllHistory();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(16)),
          child: const Text(
            'Clear All',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
