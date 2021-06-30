import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis01_osy/halaman/halamanBuahOut/cart.dart';

class OutputKeluar extends StatelessWidget {
  final List<Cart> _listKeranjang;
  OutputKeluar(this._listKeranjang); // konstruktor dengan parameter listview

  int get jumlah {
    // fungsi untuk menghitung jumlah quntity pada listview
    return _listKeranjang.fold(0, (sum, item) {
      return sum += item.qty;
    });
  }

  double get jumlahHarga {
    // fungsi untuk menghitung jumlah hargapada listview
    return _listKeranjang.fold(0, (sum, item) {
      double jumlah_harga = item.qty * item.harga;
      return sum += jumlah_harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Total Buah Keluar : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        jumlah.toString() +
                            " Kg ", // memanggil fungsi jumlah untuk menampilkanya
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Total Harga            : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'IDR. ' +
                            jumlahHarga.toStringAsFixed(
                                0), // memanggil fungsi jumlahHarga untuk menampilkanya
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
