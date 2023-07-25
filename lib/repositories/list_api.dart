import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oru_phones/models/list_model.dart';
import 'package:oru_phones/services/api_services.dart';

final userDataProvider = FutureProvider<List>((ref) async {
  return ref.read(apiProvider).getList();
});