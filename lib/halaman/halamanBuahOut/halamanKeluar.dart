import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HalamanKeluar extends StatefulWidget {
  // This widget is the root of your application.
  HalamanKeluar(this.addNew); // konstruktor yang merinama parameterr fungsi addNew
  final Function addNew;
  @override
  _HalamanKeluarState createState() => _HalamanKeluarState();
}

class _HalamanKeluarState extends State<HalamanKeluar> {
    // deklarasi textediting controller
  final titleController = new TextEditingController();
  final hargaController = new TextEditingController();
  final qtyController = new TextEditingController();
  final namaController = new TextEditingController();

  void SaveItem() { // fungsi untuk menyimpan inputan user
    final title = titleController.text;
    final nama = namaController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || nama.isEmpty || harga.isEmpty || qty <= 0) { // kondisi jika kosong tidak mengembalikan apa2
      return;
    }
    widget.addNew(title, nama, double.parse(harga), qty); // menambahkan title, nama, hargaquntity
    Navigator.of(context).pop(); // akan kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext contxt) => Scaffold(
        appBar: AppBar(
          title: Text("Buah Keluar",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 21)),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView( // agar dapat discroll
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                 // form untuk pengisian buah masuk
                TextField(
                  decoration: InputDecoration(labelText: "Buah"),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Pembeli"),
                  controller: namaController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Harga"),
                  controller: hargaController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Quantity",
                    suffixText: 'Kg',
                  ),
                  controller: qtyController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 250, top: 10),
                    child: RaisedButton(
                      child: Text("Submit"),
                      onPressed: SaveItem, // ketika disubmit ia akan memanggil fungsi save item
                      color: Colors.cyan,
                      textColor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      );
}
