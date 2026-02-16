import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';
import 'package:asn1lib/asn1lib.dart';

class EncryptionService {
  static const _publicKeyPem = '''
-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAwbGGQGbOmeOKnTHv9NOkjOEdRtYb/0hP+zTB/NYVzwP9NyZwWCdt
+eqSIvxilLQ2ozVaKF8HgGXgAZfHMAPRt+p6y8jH5N0SGm9MbwASh1f5MhnJAOwN
LNtfUfhFs4meJP55IRGjFopbYWWTM6wZcmWr73azHPXZMtF0L2jtaLWAk/awwfpK
AS3ANCNPO4PAUSbjqiRlzVZfMPnlwGwUxJ5bXmt4twgCKYLKa5rWGnMHFXlNzRad
RI/+slQiC6sRy7x/TFZEdAN8yqGcsGDKoRFOAPaI2GjhIT8/EjkzDfWXmUGDPDrv
jJ5q3SO1tOS26U9U0+px+ZxL1AK6AJ4V9QIDAQAB
-----END RSA PUBLIC KEY-----
''';

  // ---------------- AES ----------------

  static Uint8List _randomBytes(int length) {
    final rnd = Random.secure();
    return Uint8List.fromList(
      List.generate(length, (_) => rnd.nextInt(256)),
    );
  }

  static Uint8List _aesEncrypt(
      Uint8List data,
      Uint8List key,
      Uint8List iv,
      ) {
    final cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      CBCBlockCipher(AESEngine()),
    );

    cipher.init(
      true,
      PaddedBlockCipherParameters(
        ParametersWithIV(KeyParameter(key), iv),
        null,
      ),
    );

    return cipher.process(data);
  }

  // ---------------- RSA ----------------

  static RSAPublicKey _parseOldRsaPublicKey(String pem) {
    final lines = pem.split('\n').where((l) => !l.startsWith('-----')).join();

    final bytes = base64Decode(lines);
    final parser = ASN1Parser(bytes);
    final seq = parser.nextObject() as ASN1Sequence;

    final modulus = (seq.elements![0] as ASN1Integer).valueAsBigInteger;
    final exponent = (seq.elements![1] as ASN1Integer).valueAsBigInteger;

    return RSAPublicKey(modulus!, exponent!);
  }

  static Uint8List _rsaEncrypt(
      Uint8List data,
      RSAPublicKey publicKey,
      ) {
    final engine = PKCS1Encoding(RSAEngine())
      ..init(
        true,
        PublicKeyParameter<RSAPublicKey>(publicKey),
      );

    return engine.process(data);
  }

  // ---------------- PUBLIC API ----------------

  static Map<String, dynamic> encrypt(
      String apiKey,
      String secretKey,
      ) {
    final aesKey = _randomBytes(32); // AES-256
    final iv = _randomBytes(16);

    final apiEncrypted = _aesEncrypt(
      utf8.encode(apiKey) as Uint8List,
      aesKey,
      iv,
    );

    final secretEncrypted = _aesEncrypt(
      utf8.encode(secretKey),
      aesKey,
      iv,
    );

    final rsaPublicKey = _parseOldRsaPublicKey(_publicKeyPem);
    final encryptedAesKey = _rsaEncrypt(aesKey, rsaPublicKey);

    return {
      "apiKeyEnc": base64Encode(apiEncrypted),
      "secretKeyEnc": base64Encode(secretEncrypted),
      "aesKeyEnc": base64Encode(encryptedAesKey),
      "iv": base64Encode(iv),
    };
  }
}

