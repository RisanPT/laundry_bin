import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_cache_controller.g.dart';

@Riverpod(keepAlive: true)
class ImageCacheController extends _$ImageCacheController {
  @override
  Map<String, Uint8List> build() {
    return {};
  }

 Future<Uint8List> getCachedImage(String imageUrl)async {
    if(state.containsKey(imageUrl)) {
      return state[imageUrl]!;
      
    }
    final response= await Dio().get(imageUrl, options: Options(responseType: ResponseType.bytes));
    state = {
      ...state,
      imageUrl: response.data
    };
    return response.data;

  }
}
