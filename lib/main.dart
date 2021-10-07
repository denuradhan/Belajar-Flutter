import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textfield',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  TextEditingController data1 = TextEditingController();
  TextEditingController data2 = TextEditingController();
  TextEditingController data3 = TextEditingController();
  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();
  TextEditingController tinggi = TextEditingController();
  TextEditingController keliling = TextEditingController();
  TextEditingController luas = TextEditingController();
  TextEditingController volume = TextEditingController();

  String text = "";

  void hitungPersegi() {
    setState(() {
      double kelilingx =
          2 * (double.parse(this.panjang.text) + double.parse(this.lebar.text));
      this.keliling.text = kelilingx.toString();
      double luasx =
          double.parse(this.panjang.text) * double.parse(this.lebar.text);
      this.luas.text = luasx.toString();
      double volumex = double.parse(this.panjang.text) *
          double.parse(this.lebar.text) *
          double.parse(this.tinggi.text);
      this.volume.text = volumex.toString();
    });
  }

  void onClear() {
    setState(() {
      data1.clear();
      data2.clear();
      data3.clear();
      panjang.clear();
      lebar.clear();
      tinggi.clear();
      keliling.clear();
      luas.clear();
      volume.clear();
      text = "";
    });
  }

  void onPressed(String opr) {
    setState(() {
      // mengambil data terkini
      double bil1 = double.parse(data1.text);
      double bil2 = double.parse(data2.text);
      double hasil = 0;
      if (opr == "*") {
        hasil = bil1 * bil2;
        text = "perkalian berhasil";
      } else if (opr == "+") {
        hasil = bil1 + bil2;
        text = "penjumlahan berhasil";
      } else if (opr == "/") {
        hasil = bil1 / bil2;
        text = "pembagian berhasil";
      } else {
        hasil = bil1 - bil2;
        text = "pengurangan berhasil";
      }

      data3.text = hasil.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                onClear();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: data1,
              decoration: InputDecoration(
                  hintText: 'Masukkan Data 1',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            TextField(
              controller: data2,
              decoration: InputDecoration(
                  hintText: 'Masukkan Data 2',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            TextField(
              controller: data3,
              decoration: InputDecoration(
                  hintText: 'Hasilnya di sini',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 70,
                    child: RaisedButton(
                      child: Text('+'),
                      onPressed: () {
                        onPressed("+");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 70,
                    child: RaisedButton(
                      child: Text('*'),
                      onPressed: () {
                        onPressed("*");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 70,
                    child: RaisedButton(
                      child: Text('-'),
                      onPressed: () {
                        onPressed("-");
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 70,
                    child: RaisedButton(
                      child: Text('/'),
                      onPressed: () {
                        onPressed("/");
                      },
                    ),
                  ),
                ]),
            Text(text),
            TextField(
              controller: panjang,
              decoration: InputDecoration(
                  hintText: 'Masukan Panjang',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            TextField(
              controller: lebar,
              decoration: InputDecoration(
                  hintText: 'Masukan Lebar',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            TextField(
              controller: tinggi,
              decoration: InputDecoration(
                  hintText: 'Masukan Lebar',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            ButtonTheme(
              minWidth: 70,
              child: RaisedButton(
                child: Text('Hitung Persegi'),
                onPressed: () {
                  hitungPersegi();
                },
              ),
            ),
            TextField(
              controller: keliling,
              decoration: InputDecoration(
                  hintText: 'Hasil Keliling',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            TextField(
              controller: luas,
              decoration: InputDecoration(
                  hintText: 'Hasil Luas',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
            TextField(
              controller: volume,
              decoration: InputDecoration(
                  hintText: 'Volume',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
