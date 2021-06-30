import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuis01_osy/halaman/halamanBuahIn/cartt.dart';
import 'package:kuis01_osy/halaman/halamanBuahIn/halamanMasuk.dart';
import 'package:kuis01_osy/halaman/halamanBuahIn/listOutputMasuk.dart';
import 'package:kuis01_osy/halaman/halamanBuahIn/outputMasuk.dart';
import 'package:kuis01_osy/halaman/halamanBuahOut/cart.dart';
import 'package:kuis01_osy/halaman/leadingListBuah/listBuah.dart';
import 'package:kuis01_osy/halaman/halamanBuahOut/listOutputKeluar.dart';
import 'package:kuis01_osy/halaman/halamanBuahOut/outputKeluar.dart';
import 'halaman/halamanBuahOut/halamanKeluar.dart';
import 'halaman/leadingListBuah/listBuah.dart';

void main() { // sebagai main untuk running
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // agar bendera disebelah kanan atas tidak ada
    title: 'Navigation Basics', // title dari aplikasi
    home: MyApp(), // merujuk ke home, pertama kali di running muncul ini dulu
  ));
}

class MyApp extends StatefulWidget { // class app yang mengextend statefull widget
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();  // memanggil state
}

class _MyAppState extends State<MyApp> { //State
  
  final List<Cart> _keranjangs = []; //deklarasi lisview untuk buah keluar
  
  final List<Cartt> _keranjangss = []; //deklarasi lisview untuk buah masuk 

  void _openModal(BuildContext context) { 
    showCupertinoModalPopup(
        context: context, // Argumen konteks digunakan untuk mencari Navigator untuk popup. Ini hanya digunakan saat metode dipanggil. 
        builder: (_) {
          return HalamanKeluar(_tambahItemBaru); // mengembalikan nilai dari hasil inputan pada buah keluar
        });
  }

  void _openModall(BuildContext context) {
    showCupertinoModalPopup(
        context: context, // Argumen konteks digunakan untuk mencari Navigator untuk popup. Ini hanya digunakan saat metode dipanggil. 
        builder: (_) {
          return HalamanMasuk(_tambahItemBaruu); // mengembalikan nilai dari hasil inputan pada buah msduk
        });
  }

  void _tambahItemBaru(String title, String nama, double harga, int qty) { // fungsi untuk menambahkan item baru di listview buah keluar
    final itemBaru = Cart(
        id: DateTime.now().toString(),
        title: title,
        nama: nama,
        harga: harga,
        qty: qty);
    setState(() {
      _keranjangs.add(itemBaru);
    });
  }

  void _tambahItemBaruu(String title, int qty) { // fungsi untuk menambahkan item baru di listview buah masuk
    final itemBaru =
        Cartt(id: DateTime.now().toString(), title: title, qty: qty);
    setState(() {
      _keranjangss.add(itemBaru);
    });
  }

  void _resetKeranjangs() { // fungsi untuk menghapus semua listview pada buah keluar
    setState(() {
      _keranjangs.clear();
    });
  }

  void _resetKeranjangss() { // fungsi untuk menghapus semua listview pada buah masuk
    setState(() {
      _keranjangss.clear();
    });
  }

  DateTime selectedDate = DateTime.now();
  // Initial SelectDate FLutter
  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext contxt) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // agar bendera disebelah kanan atas tidak ada
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: Icon(
              Icons.featured_play_list,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => listBuah())); // jika icon ditekan akan muncul ke halaman listBuah
            },
          ),
          title: Text("TOKO BUAH OSY", // title bagian header
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 21)),
        ),
        body: SingleChildScrollView( // agar aplikasi dapat di scroll
            child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Image.asset(
                'assets/shop.jpg', // gambar banner
                width: 400.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      new Image.asset(
                        'assets/buamasuk.png',
                        width: 100.0,
                      ),
                      Container(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push( 
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HalamanMasuk(_tambahItemBaruu)), // jika tombol ditekann akan menuju ke halaman Masuk
                            );
                          },
                          color: Colors.cyan,
                          child: Text(
                            "Buah Masuk",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      new Image.asset(
                        'assets/buahkeluar.png',
                        width: 100.0,
                      ),
                      Container(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HalamanKeluar(_tambahItemBaru)), // jika tombol ditekann akan menuju ke halaman keluar
                            );
                          },
                          color: Colors.cyan,
                          child: Text(
                            "Buah Keluar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15, left: 50),
                  child: Row(
                    children: <Widget>[
                      Text("${selectedDate.toLocal()}".split(' ')[0]), // menampilkan tanggal kalender
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 80),
                        child: FlatButton(
                          onPressed: () => { // ketika memilih tanggal akan memanggil selectedDate sesuai yang tadi dipilih
                            _selectDate(context),
                            print(selectedDate.day +
                                selectedDate.month +
                                selectedDate.year)
                          },
                          child: Text(
                            'Pilih Tanggal',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0), // membuat sebuah garis horizontal
                child: Container(
                  height: 1.0,
                  width: 330.0,
                  color: Colors.black,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20, bottom: 0, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Data Pengeluaran Buah",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => _resetKeranjangs(), // tombol untuk menghpus list view pengeluaran buah
                    )
                  ],
                ),
              ),
              OutputKeluar(_keranjangs), // menampilkan ui hasil inptan seta hitungan listview dari class OutputKeluar yang berparameter nama listview (BUAH KELUAR)
              listOutput(_keranjangs), // menampilkan ui  hasil inptan seta hitungan listview dari class ListKeluar yang berparameter nama listview (BUAH KELUAR)
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30, bottom: 0, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Data Pemasukkan Buah",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => _resetKeranjangss(), // tombol untuk menghpus list view pemasukkan buah
                    )
                  ],
                ),
              ),
              OutputMasuk(_keranjangss), // menampilkan ui hasil inptan seta hitungan listview dari class OutputMasuk yang berparameter nama listview (BUAH MASUK)
              listOutputMasuk(_keranjangss) // menampilkan ui  hasil inptan seta hitungan listview dari class ListMasuk yang berparameter nama listview (BUAH MASUK)
            ],
          ),
        )),
      ),
    );
  }
}
