import 'package:crypto/crypto.dart';
import 'dart:convert';

convertMd5(String string) {
  return md5.convert(utf8.encode(string)).toString();
}
