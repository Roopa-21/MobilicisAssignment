import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:oru_phones/models/list_model.dart';

class ApiServices {
  String url =
      'https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=1&limit=10';
  Future<List<ListModel>> getList() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['listings'];
      print(result);
      print('sucss');
      return result.map(((e) => ListModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
