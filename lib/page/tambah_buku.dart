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
      // Simpan buku (di sini kita hanya mencetak ke konsol)
      print('Buku ditambahkan: $judul, $jumlah_buku, $tahun_terbit');
      // Kembali ke halaman sebelumnya
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Buku'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Judul Buku'),
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
                decoration: InputDecoration(labelText: 'jumlah buku'),
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
                decoration: InputDecoration(labelText: 'tahun terbit'),
                validator: ( value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan tahun terbit buku';
                  }
                  return null;
                },
                onChanged: (value) {
                  tahun_terbit = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addBook,
                child: Text('Tambah Buku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}