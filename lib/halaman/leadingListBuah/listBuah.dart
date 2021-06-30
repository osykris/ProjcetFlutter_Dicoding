import 'package:flutter/material.dart';

// Widget Tanpa Status Pertama dengan MaterialApp Start
class Buah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listBuah(),
    );
  }
}
// Widget Tanpa Status Pertama dengan MaterialApp Berakhir

// Mulai Widget Stateful Utama
class listBuah extends StatefulWidget {
  @override
  _listBuahState createState() => _listBuahState();
}

class _listBuahState extends State<listBuah> {
  // Daftar Judul Di Sini
  var titleList = [
    "Apel",
    "Mangga",
    "Mangga Muda",
    "Anggur",
    "Melon",
    "Strawberry",
    "Jeruk"
  ];

  // Deskripsi Daftar Di Sini
  var descList = [
    "Buah apel biasanya berwarna merah kulitnya jika masak dan (siap dimakan), namun bisa juga kulitnya berwarna hijau atau kuning.",
    "Mangga memiliki vitamin C dan serat tinggi yang dapat membantu menurunkan kadar kolesterol jahat. ",
    "Mangga muda masih putih kekuningan, sudah ada kandungan vitamin dan nutrisi yang dibutuhkan tubuh.",
    "Anggur juga mengandung banyak senyawa antioksidan yang daya kerjanya lebih kuat daripada vitamin C dan vitamin E.",
    "Melon membantu meningkatkan kesehatan tulang. ",
    "Strawberry memiliki kandungan vitamin C dan asam elagik yang baik untuk kesehatan kulit, terutama untuk mencegah penuaan dini. ",
    "Jeruk memiliki banyak kandungan vitamin C dan anti oksidan, yang meningkatkan sistem kekebalan tubuh dan membantu melawan infeksi dan flu."
  ];

  // Daftar Nama Gambar Di Sini
  var imgList = [
    "assets/apel.png",
    "assets/mangga.jpg",
    "assets/manggamuda.png",
    "assets/anggur.png",
    "assets/melon.png",
    "assets/strawberry.png",
    "assets/jeruk.png"
  ];

  // Daftar Harga Di Sini
  var hargaList = [
    "IDR. 20.000",
    "IDR. 15.000",
    "IDR. 12.000",
    "IDR. 25.000",
    "IDR. 20.000",
    "IDR. 21.000",
    "IDR. 19.000"
  ];

  @override
  Widget build(BuildContext context) {
    // Kueri Media untuk mendapatkan Lebar Perangkat
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "Daftar Buah",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 21),
        ),
        elevation: 10,
        backgroundColor: Colors.cyan,
      ),
      // Main List View dengan Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Ini Akan Memanggil Saat Pengguna Mengklik Item ListView
              showDialogFunc(
                  context, imgList[index], titleList[index], hargaList[index]);
            },
            // Kartu Yang Menyimpan Tata Letak Item ListView
            child: Card(
              margin: EdgeInsets.only(top: 5, left: 8, right: 8),
              elevation: 10,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Ini adalah blok Modal Dialog

showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
