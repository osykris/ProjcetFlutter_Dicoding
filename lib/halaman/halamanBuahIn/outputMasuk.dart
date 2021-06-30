import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis01_osy/halaman/halamanBuahIn/cartt.dart';

class OutputMasuk extends StatelessWidget {
  final List<Cartt> _listKeranjang;
  OutputMasuk(this._listKeranjang); // konstruktor dengan parameter listview

  int get jumlah { // fungsi untuk menghitung jumlah quntity pada listview
    return _listKeranjang.fold(0, (sum, item) {
      return sum += item.qty;
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
                        "Total Buah Masuk : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        jumlah.toString() + " Kg ", // memanggil fungsi jumlah untuk menampilkanya
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
