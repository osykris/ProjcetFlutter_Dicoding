import 'package:flutter/foundation.dart';

// mengatur class - class nya nanti ini akan dipanggil di souce code yang ingin memanggunakan class tersebut
// supaya lebih efesien

class Cartt {
  final String id;
  final String title;
  final int qty;

  Cartt({
    @required this.id,
    @required this.title,
    @required this.qty,
  });
}
