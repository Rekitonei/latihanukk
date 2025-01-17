import 'package:flutter/material.dart';
import 'package:kasirisni/page/halaman_register.dart';
import 'package:kasirisni/page/home.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Text(
            'Login Perpustakaan',
            style: TextStyle(color: Colors.blue, fontSize: 50),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
                fillColor: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                fillColor: Colors.blue,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Belum punya akun?'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HalamanRegister(),
                      ),
                    );
                   },
                   child: const Row(
                    children: [Text('Register Now')],
                   ))
            ],
           ),
           SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),)
                  );
                },
                child: const Center(
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Login')],
                  ),
                )),
           )
        ],),
    );
  }
}