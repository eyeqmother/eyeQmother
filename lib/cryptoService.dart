

import 'package:encrypt/encrypt.dart';

class CryptoService {
  static String key = "JkqS7pW3oTmN9uY8xVbF1dLr";

  static String encryptAES(String text, ) {
    final keyBytes = Key.fromUtf8(key);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(keyBytes));
    final encrypted = encrypter.encrypt(text, iv: iv);

    return encrypted.base64;
  }

  static String decryptAES(String encryptedText) {
    final keyBytes = Key.fromUtf8(key);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(keyBytes));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);

    return decrypted;
  }
}