import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String nama = 'Nama';
  final String alamat = 'Alamat';
  final String jurusan = 'Jurusan';
  final String simpan = 'Simpan';
  final String judul = 'Formulir Mahasiswa';

  // TextEditingController untuk setiap input
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: 600,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Formulir
                Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: Text(
                    judul,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Spacer
                // Input Nama
                TextField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: nama,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15), // Spacer
                // Input Alamat
                TextField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    labelText: alamat,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15), // Spacer
                // Input Jurusan
                TextField(
                  controller: jurusanController,
                  decoration: InputDecoration(
                    labelText: jurusan,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15), // Spacer
                // Tombol
                ElevatedButton(
                  onPressed: () {
                    // Ambil nilai dari setiap controller
                    String nama = namaController.text;
                    String alamat = alamatController.text;
                    String jurusan = jurusanController.text;

                    // Kode untuk menangani aksi saat tombol ditekan
                    print('Nama: $nama');
                    print('Alamat: $alamat');
                    print('Jurusan: $jurusan');

                    // Lakukan sesuatu dengan nilai yang diambil, misalnya kirim ke server atau tampilkan notifikasi
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the value as you want
                    ),
                  ),
                  child: Text(
                    simpan,
                    style:
                        TextStyle(fontSize: 18), // Mengatur ukuran teks tombol
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
