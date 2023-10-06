import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myan_encrypt/myan_encrypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter String Encryptor')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Enc1 normalEncrypt = Enc1('_encryptionKey');
                    log(normalEncrypt.encrypt('plainText'));
                  },
                  child: const Text('Encrypt I'),
                ),
                TextButton(
                  onPressed: () {
                    Enc1 encryptUtil = Enc1('_encryptionKey');
                    log(encryptUtil.encrypt('plainText'));
                  },
                  child: const Text('Decrypt I'),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Enc2 encryptUtil = Enc2('_encryptionKey', '_hmacKey');
                    log(encryptUtil.encrypt('plainText'));
                  },
                  child: const Text('Encrypt II'),
                ),
                TextButton(
                  onPressed: () {
                    Enc2 encryptUtil = Enc2('_encryptionKey', '_hmacKey');
                    log(encryptUtil.decrypt(encryptUtil.encrypt('plainText')));
                  },
                  child: const Text('Decrypt II'),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Enc3 encryptUtil2 = Enc3('encryptionKey');
                    log(encryptUtil2.encrypt('plainText'));
                  },
                  child: const Text('Encrypt III'),
                ),
                TextButton(
                  onPressed: () {
                    Enc3 encryptUtil2 = Enc3('encryptionKey');
                    log(encryptUtil2
                        .decrypt(encryptUtil2.encrypt('plainText')));
                  },
                  child: const Text('Decrypt III'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
