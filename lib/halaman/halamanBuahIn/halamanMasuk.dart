import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HalamanMasuk extends StatefulWidget {
  // This widget is the root of your application.
  HalamanMasuk(
      this.addNew); // konstruktor yang merinama parameterr fungsi addNew
  final Function addNew;
  @override
  _HalamanMasukState createState() => _HalamanMasukState();
}

class _HalamanMasukState extends State<HalamanMasuk> {
  // deklarasi textediting controller
  final titleController = new TextEditingController();
  final hargaController = new TextEditingController();
  final qtyController = new TextEditingController();
  final namaController = new TextEditingController();

  void SaveItemm() {
    // fungsi untuk menyimpan inputan user
    final title = titleController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || qty <= 0) {
      // kondisi jika kosong tidak mengembalikan apa2
      return;
    }
    widget.addNew(title, qty); // menambahkan title dan quntity
    Navigator.of(context).pop(); // akan kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext contxt) => Scaffold(
        appBar: AppBar(
          title: Text("Buah Masuk",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 21)),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          // agar dapat discroll
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
                      onPressed:
                          SaveItemm, // ketika disubmit ia akan memanggil fungsi save itemm
                      color: Colors.cyan,
                      textColor: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      );
}
