import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuis01_osy/halaman/halamanBuahIn/cartt.dart';

class listOutputMasuk extends StatelessWidget {
  final List<Cartt> keranjangs;
  listOutputMasuk(this.keranjangs); // konstruktor dengan parameter listview

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: keranjangs
                .isEmpty // jika lisview kosong maka akan menampilkan text seperti di bawah
            ? Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10),
                    child: Text("------Tidak ada pemasukkan buah------",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                  ),
                ],
              )
            : ListView.builder(
                // menggunakan lisview item builder
                itemCount: keranjangs.length, // jumlah list item
                itemBuilder: (context, index) {
                  // untuk membangun tampilan dari list item
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            keranjangs[index]
                                .qty
                                .toString(), // menampilkan quantity dari list view sesuai yang diinputkan tadi
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        //  menampilkan  title, dan quantity dari listview sesuai yang diinputkan sebelumnya
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Buah      - ' + keranjangs[index].title,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            Text(
                                'Jumlah : ' +
                                    keranjangs[index].qty.toStringAsFixed(0) +
                                    ' Kg',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
