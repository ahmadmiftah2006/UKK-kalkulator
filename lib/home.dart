import 'package:flutter/material.dart';
import 'package:ukk_kalkulator2/lenght.dart';
import 'package:ukk_kalkulator2/date-calcu.dart';
import 'package:ukk_kalkulator2/kalkulator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat Datang di',
              ),
              const Text(
                'Kalkulator!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    width: 150,
                    height: 220,
                    decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Icon(
                            Icons.calculate_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        const Text(
                          'Kalkulator',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    'Kalkulator',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Fitur kalkulator akan memudahkan anda melakukan operasi perhitungan seperti penambahan, pengurangan, perkalian dan lain sebagainya.',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('Mengerti'),
                                    ),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.info,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Kalkulator()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    width: 150,
                    height: 220,
                    decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Icon(
                            Icons.more_time_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        const Text(
                          'Kalkulasi Tanggal',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    'Kalkulasi Tanggal',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Fitur kalkulasi Tanggal akan memudahkan anda dalam menentukan jumlah tahun, bulan, minggu dan hari diantara dua tanggal yang telah ditentukan',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('Mengerti'),
                                    ),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.info,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KalkulasiTanggal()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    width: 150,
                    height: 220,
                    decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Icon(
                            Icons.stairs_outlined,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        const Text(
                          'Satuan Panjang',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    'Perhitungan Satuan Panjang',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Fitur Perhitungan Satuan akan memudahkan anda melakukan perhitungan perbedaan satuan panjang',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('Mengerti'),
                                    ),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.info,
                                size: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PanjangCalculator()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Center(
              child: Text(
            'By Ahmad Miftah',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ))),
    );
  }
}
