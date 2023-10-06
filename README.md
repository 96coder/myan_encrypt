Flutter String encryption package

## Features

- Enc1
- Enc2
- Enc3

## Getting started

add myan_encrypt: ^latest_version

## Usage

```dart
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
                    NormalEncrypt normalEncrypt =
                        NormalEncrypt('_encryptionKey');
                    log(normalEncrypt.encrypt('plainText'));
                  },
                  child: const Text('Normal Encrypt'),
                ),
                TextButton(
                  onPressed: () {
                    NormalEncrypt normalEncrypt =
                        NormalEncrypt('_encryptionKey');
                    log(normalEncrypt
                        .decrypt(normalEncrypt.encrypt('plainText')));
                  },
                  child: const Text('Normal Decrypt'),
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
                    EncryptUtil encryptUtil =
                        EncryptUtil('_encryptionKey', '_hmacKey');
                    log(encryptUtil.encrypt('plainText'));
                  },
                  child: const Text('Encrypt I'),
                ),
                TextButton(
                  onPressed: () {
                    EncryptUtil encryptUtil =
                        EncryptUtil('_encryptionKey', '_hmacKey');
                    log(encryptUtil.decrypt(encryptUtil.encrypt('plainText')));
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
                    EncryptUtil2 encryptUtil2 = EncryptUtil2('encryptionKey');
                    log(encryptUtil2.encrypt('plainText'));
                  },
                  child: const Text('Encrypt II'),
                ),
                TextButton(
                  onPressed: () {
                    EncryptUtil2 encryptUtil2 = EncryptUtil2('encryptionKey');
                    log(encryptUtil2
                        .decrypt(encryptUtil2.encrypt('plainText')));
                  },
                  child: const Text('Decrypt II'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

```