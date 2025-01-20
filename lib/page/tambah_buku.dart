import 'package:flutter/material.dart';

class Tambahbuku extends StatefulWidget {
  @override
  _TambahbukuState createState() => _TambahbukuState();
}

class _TambahbukuState extends State<Tambahbuku> {
  final _formKey = GlobalKey<FormState>();
  String judul = '';
  String jumlah_buku = '';
  String tahun_terbit = '';

  void _addBook() {
    if (_formKey.currentState!.validate()) {
      // Kirim data buku yang baru ke halaman sebelumnya
      Navigator.pop(context, {
        "judul": judul,
        "jumlah": jumlah_buku,
        "tahun": tahun_terbit,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Judul Buku'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan judul buku';
                  }
                  return null;
                },
                onChanged: (value) {
                  judul = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Jumlah Buku'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan jumlah buku';
                  }
                  return null;
                },
                onChanged: (value) {
                  jumlah_buku = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tahun Terbit'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan tahun terbit buku';
                  }
                  return null;
                },
                onChanged: (value) {
                  tahun_terbit = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addBook,
                child: const Text('Tambah Buku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
