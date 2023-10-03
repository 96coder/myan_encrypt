Flutter String encryption package

## Features

- NormalEncrypt
- EncryptUtil
- EncryptUtil2

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
  NormalEncrypt normalEncrypt = NormalEncrypt('_encryptionKey');
  String normalencrypted() => normalEncrypt.encrypt('plainText');
  String normaldecrypted() => normalEncrypt.decrypt('encryptedText');

  EncryptUtil encryptUtil = EncryptUtil('_encryptionKey', '_hmacKey');
  String encrypted() => encryptUtil.encrypt('plainText');
  String decrypted() => encryptUtil.decrypt('encryptedText');

  EncryptUtil2 encryptUtil2 = EncryptUtil2('encryptionKey');
  String encryptedstring() => encryptUtil2.encrypt('plainText');
  String decryptedstring() => encryptUtil2.decrypt('encryptedText');
```

# myan_encrypt
