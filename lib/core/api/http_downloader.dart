import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class HttpDownloader {
  static Future<Uint8List> download(String url) async {
    final completer = Completer<Uint8List>();
    final client = http.Client();
    final request = http.Request('Get', Uri.parse(url));
    final response = client.send(request);
    int downloadBytes = 0 ;
    List<List<int>> chunkList = [];

    response.asStream().listen((event) {
      
    });
    return completer.future;
  }
}
