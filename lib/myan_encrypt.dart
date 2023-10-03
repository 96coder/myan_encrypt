library myan_encrypt;

import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

class NormalEncrypt {
  final String _encryptionKey;

  NormalEncrypt(this._encryptionKey);

  String encrypt(String text) {
    final encrypter = Encrypter(AES(Key.fromBase64(_encryptionKey)));
    final encrypted = encrypter.encrypt(text);
    return encrypted.base64;
  }

  String decrypt(String encryptedText) {
    final encrypter = Encrypter(AES(Key.fromBase64(_encryptionKey)));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedText));
    return decrypted;
  }
}

///

class EncryptUtil {
  final String _encryptionKey;
  final String _hmacKey;

  EncryptUtil(this._encryptionKey, this._hmacKey);

  String encrypt(String text) {
    final key = Key.fromUtf8(_encryptionKey);
    final iv = IV.fromSecureRandom(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);

    final hmac =
        crypto.Hmac(crypto.sha256, Uint8List.fromList(_hmacKey.codeUnits));
    final digest = hmac.convert(encrypted.bytes);

    final encodedText =
        "${base64Encode(iv.bytes)}:${base64Encode(encrypted.bytes)}:$digest";

    return encodedText;
  }

  String decrypt(String encryptedText) {
    final parts = encryptedText.split(":");
    if (parts.length != 3) {
      throw Exception("Invalid encrypted text format");
    }

    final iv = IV(Uint8List.fromList(base64Decode(parts[0])));
    final encrypted = Encrypted(Uint8List.fromList(base64Decode(parts[1])));
    final digest =
        crypto.Hmac(crypto.sha256, Uint8List.fromList(_hmacKey.codeUnits))
            .convert(encrypted.bytes);

    if (digest.toString() != parts[2]) {
      throw Exception("HMAC verification failed");
    }

    final key = Key.fromUtf8(_encryptionKey);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}

///

class EncryptUtil2 {
  final Key _encryptionKey;

  EncryptUtil2(String encryptionKey)
      : _encryptionKey = Key.fromUtf8(encryptionKey);

  String encrypt(String plainText) {
    final encrypter = Encrypter(AES(_encryptionKey, mode: AESMode.cbc));
    final iv = IV.fromLength(16); // You can use a secure method to generate IV
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    // Concatenate IV and encrypted data into a single string
    final encodedText = base64Encode(iv.bytes) + encrypted.base64;

    return encodedText;
  }

  String decrypt(String encryptedText) {
    final ivBytes = base64Decode(encryptedText.substring(0, 24));
    final encryptedData = encryptedText.substring(24);

    final encrypter = Encrypter(AES(_encryptionKey, mode: AESMode.cbc));
    final iv = IV(ivBytes);

    final decrypted = encrypter.decrypt(
      Encrypted.fromBase64(encryptedData),
      iv: iv,
    );

    return decrypted;
  }
}
