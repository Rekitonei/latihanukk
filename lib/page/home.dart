import 'package:flutter/material.dart';
import 'package:kasirisni/page/halaman_register.dart';
import 'package:kasirisni/page/tambah_buku.dart';
import 'halaman_buku.dart';

void main() {
  runApp(LibraryApp());
}

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perpustakaan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> bukuList = [
    {"judul": "Buku Fiksi", "jumlah": "10", "tahun": "2020"},
    {"judul": "Buku Non-Fiksi", "jumlah": "5", "tahun": "2019"},
    {"judul": "Referensi Akademik", "jumlah": "8", "tahun": "2021"},
    {"judul": "Buku Anak-Anak", "jumlah": "12", "tahun": "2018"},
    {"judul": "Novel Fantasi", "jumlah": "6", "tahun": "2022"},
    {"judul": "Ensiklopedia", "jumlah": "15", "tahun": "2017"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpustakaan App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [
            const SizedBox(height: 32),
            const ListTile(
              title: Text(
                'Perpustakaan App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark_add),
              title: const Text('Tambah Buku'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tambahbuku(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang di Perpustakaan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Perpustakaan kami menyediakan berbagai koleksi buku mulai dari fiksi, non-fiksi, hingga referensi akademik. Temukan buku favorit Anda atau eksplorasi koleksi kami!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HalamanRegister()));
              },
              child: const Text('Jelajahi Koleksi'),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: bukuList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final buku = bukuList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanBuku(
                            judul: buku["judul"]!,
                            jumlahBuku: buku["jumlah"]!,
                            tahunTerbit: buku["tahun"]!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.book,
                            size: 50,
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            buku["judul"]!,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
