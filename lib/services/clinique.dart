import 'package:http/http.dart' as http;

class CliniqueSApiervice {
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }
}