import 'package:flutter/foundation.dart';

// mengatur class - class nya nanti ini akan dipanggil di souce code yang ingin memanggunakan class tersebut
// supaya lebih efesien

class Cart {
  final String id;
  final String title;
  final String nama;
  final double harga;
  final int qty;

  Cart({
    @required this.id,
    @required this.title,
    @required this.nama,
    @required this.harga,
    @required this.qty,
  });
}
